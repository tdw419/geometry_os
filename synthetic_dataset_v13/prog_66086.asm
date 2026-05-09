; DESCRIPTION: Draws a red line from (403, 211) to (172, 73).
; PLAN: r0=403(x1), r1=211(y1), r2=172(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 211
LDI r2, 172
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
