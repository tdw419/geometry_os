; DESCRIPTION: Places a white line segment connecting (306, 174) to (461, 243).
; PLAN: r0=306(x1), r1=174(y1), r2=461(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 174
LDI r2, 461
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
