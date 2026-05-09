; DESCRIPTION: Draws a red line from (403, 24) to (221, 204).
; PLAN: r0=403(x1), r1=24(y1), r2=221(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 24
LDI r2, 221
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
