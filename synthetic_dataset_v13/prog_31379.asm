; DESCRIPTION: Renders a yellow line between points (463, 233) and (407, 231).
; PLAN: r0=463(x1), r1=233(y1), r2=407(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 233
LDI r2, 407
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
