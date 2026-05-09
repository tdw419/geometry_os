; DESCRIPTION: Draws a white line from (206, 220) to (183, 201).
; PLAN: r0=206(x1), r1=220(y1), r2=183(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 220
LDI r2, 183
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
