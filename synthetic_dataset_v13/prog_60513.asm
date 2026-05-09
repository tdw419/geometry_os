; DESCRIPTION: Places a green line segment connecting (240, 16) to (40, 222).
; PLAN: r0=240(x1), r1=16(y1), r2=40(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 16
LDI r2, 40
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
