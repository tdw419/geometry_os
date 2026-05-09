; DESCRIPTION: Places a yellow 11x22 rectangle at position (95, 230).
; PLAN: r0=95(x), r1=230(y), r2=11(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 230
LDI r2, 11
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
