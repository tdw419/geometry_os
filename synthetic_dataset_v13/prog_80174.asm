; DESCRIPTION: Places a white line segment connecting (475, 45) to (226, 243).
; PLAN: r0=475(x1), r1=45(y1), r2=226(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 45
LDI r2, 226
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
