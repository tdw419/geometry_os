; DESCRIPTION: Draws a black line from (435, 222) to (60, 106).
; PLAN: r0=435(x1), r1=222(y1), r2=60(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 222
LDI r2, 60
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
