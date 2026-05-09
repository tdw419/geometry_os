; DESCRIPTION: Draws a green line from (165, 164) to (269, 185).
; PLAN: r0=165(x1), r1=164(y1), r2=269(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 164
LDI r2, 269
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
