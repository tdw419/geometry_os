; DESCRIPTION: Draws a red line from (317, 124) to (197, 227).
; PLAN: r0=317(x1), r1=124(y1), r2=197(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 124
LDI r2, 197
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
