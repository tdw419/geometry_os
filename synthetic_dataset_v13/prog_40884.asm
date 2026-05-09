; DESCRIPTION: Places a black line segment connecting (164, 187) to (453, 65).
; PLAN: r0=164(x1), r1=187(y1), r2=453(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 187
LDI r2, 453
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
