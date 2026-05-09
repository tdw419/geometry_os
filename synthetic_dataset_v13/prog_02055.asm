; DESCRIPTION: Draws a red line from (94, 204) to (259, 142).
; PLAN: r0=94(x1), r1=204(y1), r2=259(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 204
LDI r2, 259
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
