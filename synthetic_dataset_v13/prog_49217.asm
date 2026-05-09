; DESCRIPTION: Places a purple line segment connecting (130, 165) to (445, 164).
; PLAN: r0=130(x1), r1=165(y1), r2=445(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 165
LDI r2, 445
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
