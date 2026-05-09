; DESCRIPTION: Places a orange line segment connecting (265, 130) to (328, 139).
; PLAN: r0=265(x1), r1=130(y1), r2=328(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 130
LDI r2, 328
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
