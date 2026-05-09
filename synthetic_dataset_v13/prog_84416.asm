; DESCRIPTION: Draws a green line from (5, 243) to (128, 185).
; PLAN: r0=5(x1), r1=243(y1), r2=128(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 243
LDI r2, 128
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
