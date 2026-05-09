; DESCRIPTION: Places a yellow line segment connecting (138, 144) to (143, 242).
; PLAN: r0=138(x1), r1=144(y1), r2=143(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 144
LDI r2, 143
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
