; DESCRIPTION: Renders a red line between points (106, 194) and (187, 188).
; PLAN: r0=106(x1), r1=194(y1), r2=187(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 194
LDI r2, 187
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
