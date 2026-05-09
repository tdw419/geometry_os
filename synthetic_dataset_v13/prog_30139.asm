; DESCRIPTION: Draws a white line from (282, 197) to (400, 34).
; PLAN: r0=282(x1), r1=197(y1), r2=400(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 197
LDI r2, 400
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
