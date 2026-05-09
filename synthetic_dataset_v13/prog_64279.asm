; DESCRIPTION: Draws a orange line from (403, 120) to (349, 88).
; PLAN: r0=403(x1), r1=120(y1), r2=349(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 120
LDI r2, 349
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
