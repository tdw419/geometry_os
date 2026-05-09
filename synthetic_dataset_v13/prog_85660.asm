; DESCRIPTION: Renders a black line between points (135, 157) and (460, 84).
; PLAN: r0=135(x1), r1=157(y1), r2=460(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 157
LDI r2, 460
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
