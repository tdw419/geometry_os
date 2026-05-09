; DESCRIPTION: Places a red line segment connecting (144, 86) to (108, 209).
; PLAN: r0=144(x1), r1=86(y1), r2=108(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 86
LDI r2, 108
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
