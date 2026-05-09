; DESCRIPTION: Renders a black line between points (307, 47) and (495, 179).
; PLAN: r0=307(x1), r1=47(y1), r2=495(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 47
LDI r2, 495
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
