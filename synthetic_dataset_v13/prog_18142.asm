; DESCRIPTION: Places a yellow line segment connecting (341, 193) to (240, 209).
; PLAN: r0=341(x1), r1=193(y1), r2=240(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 193
LDI r2, 240
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
