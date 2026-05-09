; DESCRIPTION: Places a yellow line segment connecting (18, 44) to (465, 33).
; PLAN: r0=18(x1), r1=44(y1), r2=465(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 44
LDI r2, 465
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
