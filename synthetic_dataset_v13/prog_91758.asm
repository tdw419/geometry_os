; DESCRIPTION: Draws a black line from (132, 48) to (205, 135).
; PLAN: r0=132(x1), r1=48(y1), r2=205(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 48
LDI r2, 205
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
