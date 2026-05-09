; DESCRIPTION: Places a red line segment connecting (213, 47) to (500, 66).
; PLAN: r0=213(x1), r1=47(y1), r2=500(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 47
LDI r2, 500
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
