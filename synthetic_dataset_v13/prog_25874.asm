; DESCRIPTION: Draws a green line from (495, 114) to (56, 4).
; PLAN: r0=495(x1), r1=114(y1), r2=56(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 114
LDI r2, 56
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
