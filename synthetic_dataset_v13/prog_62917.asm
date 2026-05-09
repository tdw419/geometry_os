; DESCRIPTION: Places a yellow 12x114 rectangle at position (256, 78).
; PLAN: r0=256(x), r1=78(y), r2=12(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 78
LDI r2, 12
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
