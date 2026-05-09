; DESCRIPTION: Draws a yellow line from (403, 211) to (437, 48).
; PLAN: r0=403(x1), r1=211(y1), r2=437(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 211
LDI r2, 437
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
