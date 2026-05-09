; DESCRIPTION: Draws a yellow line from (349, 117) to (83, 120).
; PLAN: r0=349(x1), r1=117(y1), r2=83(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 117
LDI r2, 83
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
