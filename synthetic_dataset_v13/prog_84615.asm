; DESCRIPTION: Places a black line segment connecting (63, 175) to (295, 153).
; PLAN: r0=63(x1), r1=175(y1), r2=295(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 175
LDI r2, 295
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
