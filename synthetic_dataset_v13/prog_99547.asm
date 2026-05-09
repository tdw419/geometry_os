; DESCRIPTION: Draws a green line from (44, 194) to (156, 169).
; PLAN: r0=44(x1), r1=194(y1), r2=156(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 194
LDI r2, 156
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
