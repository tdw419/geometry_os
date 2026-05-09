; DESCRIPTION: Renders a green box of size 27x37 starting at (463, 89).
; PLAN: r0=463(x), r1=89(y), r2=27(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 89
LDI r2, 27
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
