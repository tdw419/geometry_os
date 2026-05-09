; DESCRIPTION: Places a yellow line segment connecting (39, 44) to (103, 26).
; PLAN: r0=39(x1), r1=44(y1), r2=103(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 44
LDI r2, 103
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
