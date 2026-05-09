; DESCRIPTION: Draws a yellow line from (353, 139) to (403, 35).
; PLAN: r0=353(x1), r1=139(y1), r2=403(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 139
LDI r2, 403
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
