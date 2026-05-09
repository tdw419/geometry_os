; DESCRIPTION: Places a black 77x88 rectangle at position (80, 65).
; PLAN: r0=80(x), r1=65(y), r2=77(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 65
LDI r2, 77
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
