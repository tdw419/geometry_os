; DESCRIPTION: Draws a cyan line from (169, 241) to (444, 185).
; PLAN: r0=169(x1), r1=241(y1), r2=444(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 241
LDI r2, 444
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
