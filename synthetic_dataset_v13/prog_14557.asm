; DESCRIPTION: Draws a red line from (454, 174) to (403, 83).
; PLAN: r0=454(x1), r1=174(y1), r2=403(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 174
LDI r2, 403
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
