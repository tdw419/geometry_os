; DESCRIPTION: Places a green line segment connecting (176, 130) to (164, 230).
; PLAN: r0=176(x1), r1=130(y1), r2=164(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 130
LDI r2, 164
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
