; DESCRIPTION: Places a green line segment connecting (128, 130) to (292, 118).
; PLAN: r0=128(x1), r1=130(y1), r2=292(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 130
LDI r2, 292
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
