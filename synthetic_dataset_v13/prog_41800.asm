; DESCRIPTION: Places a white line segment connecting (243, 110) to (462, 249).
; PLAN: r0=243(x1), r1=110(y1), r2=462(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 110
LDI r2, 462
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
