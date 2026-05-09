; DESCRIPTION: Draws a white line from (201, 165) to (398, 118).
; PLAN: r0=201(x1), r1=165(y1), r2=398(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 165
LDI r2, 398
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
