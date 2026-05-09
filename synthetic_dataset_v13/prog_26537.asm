; DESCRIPTION: Draws a black line from (167, 25) to (250, 224).
; PLAN: r0=167(x1), r1=25(y1), r2=250(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 25
LDI r2, 250
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
