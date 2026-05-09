; DESCRIPTION: Places a white line segment connecting (398, 226) to (297, 118).
; PLAN: r0=398(x1), r1=226(y1), r2=297(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 226
LDI r2, 297
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
