; DESCRIPTION: Places a white line segment connecting (300, 47) to (96, 148).
; PLAN: r0=300(x1), r1=47(y1), r2=96(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 47
LDI r2, 96
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
