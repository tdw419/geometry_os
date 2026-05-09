; DESCRIPTION: Renders a black line between points (218, 54) and (143, 38).
; PLAN: r0=218(x1), r1=54(y1), r2=143(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 54
LDI r2, 143
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
