; DESCRIPTION: Places a purple line segment connecting (289, 245) to (146, 29).
; PLAN: r0=289(x1), r1=245(y1), r2=146(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 245
LDI r2, 146
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
