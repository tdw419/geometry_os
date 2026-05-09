; DESCRIPTION: Draws a red line from (151, 52) to (403, 48).
; PLAN: r0=151(x1), r1=52(y1), r2=403(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 52
LDI r2, 403
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
