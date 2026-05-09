; DESCRIPTION: Renders a blue line between points (351, 205) and (210, 47).
; PLAN: r0=351(x1), r1=205(y1), r2=210(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 205
LDI r2, 210
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
