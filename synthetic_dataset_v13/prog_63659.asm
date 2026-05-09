; DESCRIPTION: Draws a white line from (236, 65) to (425, 1).
; PLAN: r0=236(x1), r1=65(y1), r2=425(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 65
LDI r2, 425
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
