; DESCRIPTION: Draws a black line from (250, 48) to (135, 28).
; PLAN: r0=250(x1), r1=48(y1), r2=135(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 48
LDI r2, 135
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
