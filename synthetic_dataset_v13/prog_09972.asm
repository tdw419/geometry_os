; DESCRIPTION: Renders a green box of size 35x117 starting at (251, 23).
; PLAN: r0=251(x), r1=23(y), r2=35(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 23
LDI r2, 35
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
