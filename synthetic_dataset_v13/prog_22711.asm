; DESCRIPTION: Draws a yellow line from (394, 140) to (80, 218).
; PLAN: r0=394(x1), r1=140(y1), r2=80(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 140
LDI r2, 80
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
