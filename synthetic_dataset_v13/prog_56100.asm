; DESCRIPTION: Renders a red line between points (46, 132) and (416, 183).
; PLAN: r0=46(x1), r1=132(y1), r2=416(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 132
LDI r2, 416
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
