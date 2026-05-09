; DESCRIPTION: Draws a green line from (211, 80) to (180, 65).
; PLAN: r0=211(x1), r1=80(y1), r2=180(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 80
LDI r2, 180
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
