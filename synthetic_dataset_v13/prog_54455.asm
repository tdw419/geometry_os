; DESCRIPTION: Renders a yellow line between points (295, 22) and (359, 219).
; PLAN: r0=295(x1), r1=22(y1), r2=359(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 22
LDI r2, 359
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
