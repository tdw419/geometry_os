; DESCRIPTION: Renders a white line between points (1, 212) and (363, 222).
; PLAN: r0=1(x1), r1=212(y1), r2=363(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 212
LDI r2, 363
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
