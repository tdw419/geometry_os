; DESCRIPTION: Draws a white line from (220, 218) to (160, 4).
; PLAN: r0=220(x1), r1=218(y1), r2=160(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 218
LDI r2, 160
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
