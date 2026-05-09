; DESCRIPTION: Places a green line segment connecting (372, 109) to (240, 122).
; PLAN: r0=372(x1), r1=109(y1), r2=240(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 109
LDI r2, 240
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
