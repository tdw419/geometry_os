; DESCRIPTION: Draws a black line from (206, 211) to (185, 161).
; PLAN: r0=206(x1), r1=211(y1), r2=185(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 211
LDI r2, 185
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
