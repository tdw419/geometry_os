; DESCRIPTION: Places a green line segment connecting (305, 3) to (511, 17).
; PLAN: r0=305(x1), r1=3(y1), r2=511(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 3
LDI r2, 511
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
