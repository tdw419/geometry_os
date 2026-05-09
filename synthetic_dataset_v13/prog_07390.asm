; DESCRIPTION: Places a green line segment connecting (253, 247) to (350, 28).
; PLAN: r0=253(x1), r1=247(y1), r2=350(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 247
LDI r2, 350
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
