; DESCRIPTION: Places a green line segment connecting (342, 151) to (240, 170).
; PLAN: r0=342(x1), r1=151(y1), r2=240(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 151
LDI r2, 240
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
