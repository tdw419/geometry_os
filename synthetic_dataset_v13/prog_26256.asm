; DESCRIPTION: Places a yellow 95x11 rectangle at position (237, 58).
; PLAN: r0=237(x), r1=58(y), r2=95(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 58
LDI r2, 95
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
