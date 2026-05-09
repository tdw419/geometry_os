; DESCRIPTION: Places a cyan line segment connecting (472, 50) to (349, 130).
; PLAN: r0=472(x1), r1=50(y1), r2=349(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 50
LDI r2, 349
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
