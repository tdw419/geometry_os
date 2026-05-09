; DESCRIPTION: Renders a white line between points (431, 212) and (208, 178).
; PLAN: r0=431(x1), r1=212(y1), r2=208(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 212
LDI r2, 208
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
