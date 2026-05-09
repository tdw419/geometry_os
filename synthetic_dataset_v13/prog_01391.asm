; DESCRIPTION: Draws a red line from (204, 11) to (273, 91).
; PLAN: r0=204(x1), r1=11(y1), r2=273(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 11
LDI r2, 273
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
