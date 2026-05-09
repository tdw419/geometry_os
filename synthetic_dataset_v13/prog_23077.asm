; DESCRIPTION: Draws a black line from (495, 151) to (156, 96).
; PLAN: r0=495(x1), r1=151(y1), r2=156(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 151
LDI r2, 156
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
