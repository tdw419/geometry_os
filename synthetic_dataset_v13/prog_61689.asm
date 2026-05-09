; DESCRIPTION: Renders a green box of size 56x109 starting at (319, 78).
; PLAN: r0=319(x), r1=78(y), r2=56(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 78
LDI r2, 56
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
