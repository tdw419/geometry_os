; DESCRIPTION: Renders a black line between points (495, 153) and (142, 231).
; PLAN: r0=495(x1), r1=153(y1), r2=142(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 153
LDI r2, 142
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
