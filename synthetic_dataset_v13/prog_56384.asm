; DESCRIPTION: Renders a yellow box of size 21x81 starting at (407, 75).
; PLAN: r0=407(x), r1=75(y), r2=21(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 75
LDI r2, 21
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
