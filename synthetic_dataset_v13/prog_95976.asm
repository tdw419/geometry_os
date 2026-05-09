; DESCRIPTION: Places a yellow line segment connecting (59, 106) to (295, 175).
; PLAN: r0=59(x1), r1=106(y1), r2=295(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 106
LDI r2, 295
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
