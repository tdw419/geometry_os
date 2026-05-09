; DESCRIPTION: Renders a green box of size 85x75 starting at (361, 99).
; PLAN: r0=361(x), r1=99(y), r2=85(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 99
LDI r2, 85
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
