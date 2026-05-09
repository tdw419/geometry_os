; DESCRIPTION: Draws a white line from (235, 104) to (400, 34).
; PLAN: r0=235(x1), r1=104(y1), r2=400(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 104
LDI r2, 400
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
