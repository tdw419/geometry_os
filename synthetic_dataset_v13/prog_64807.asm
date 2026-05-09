; DESCRIPTION: Renders a black line between points (127, 104) and (415, 56).
; PLAN: r0=127(x1), r1=104(y1), r2=415(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 104
LDI r2, 415
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
