; DESCRIPTION: Draws a black line from (233, 149) to (492, 37).
; PLAN: r0=233(x1), r1=149(y1), r2=492(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 149
LDI r2, 492
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
