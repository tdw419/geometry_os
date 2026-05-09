; DESCRIPTION: Draws a white line from (236, 37) to (250, 223).
; PLAN: r0=236(x1), r1=37(y1), r2=250(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 37
LDI r2, 250
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
