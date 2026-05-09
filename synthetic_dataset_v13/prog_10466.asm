; DESCRIPTION: Places a green line segment connecting (426, 96) to (305, 122).
; PLAN: r0=426(x1), r1=96(y1), r2=305(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 96
LDI r2, 305
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
