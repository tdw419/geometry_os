; DESCRIPTION: Places a cyan line segment connecting (29, 130) to (118, 110).
; PLAN: r0=29(x1), r1=130(y1), r2=118(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 130
LDI r2, 118
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
