; DESCRIPTION: Draws a white line from (228, 58) to (5, 201).
; PLAN: r0=228(x1), r1=58(y1), r2=5(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 58
LDI r2, 5
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
