; DESCRIPTION: Draws a red line from (213, 55) to (403, 157).
; PLAN: r0=213(x1), r1=55(y1), r2=403(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 55
LDI r2, 403
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
