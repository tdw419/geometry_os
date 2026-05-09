; DESCRIPTION: Places a yellow 60x15 rectangle at position (225, 36).
; PLAN: r0=225(x), r1=36(y), r2=60(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 36
LDI r2, 60
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
