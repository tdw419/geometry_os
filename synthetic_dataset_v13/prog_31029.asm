; DESCRIPTION: Places a yellow line segment connecting (359, 242) to (174, 226).
; PLAN: r0=359(x1), r1=242(y1), r2=174(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 242
LDI r2, 174
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
