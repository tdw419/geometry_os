; DESCRIPTION: Draws a white line from (212, 145) to (420, 64).
; PLAN: r0=212(x1), r1=145(y1), r2=420(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 145
LDI r2, 420
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
