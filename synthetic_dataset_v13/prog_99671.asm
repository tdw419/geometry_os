; DESCRIPTION: Draws a red line from (112, 180) to (209, 201).
; PLAN: r0=112(x1), r1=180(y1), r2=209(x2), r3=201(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 180
LDI r2, 209
LDI r3, 201
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
