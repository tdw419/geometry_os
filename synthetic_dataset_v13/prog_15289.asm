; DESCRIPTION: Renders a cyan line between points (431, 94) and (472, 241).
; PLAN: r0=431(x1), r1=94(y1), r2=472(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 94
LDI r2, 472
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
