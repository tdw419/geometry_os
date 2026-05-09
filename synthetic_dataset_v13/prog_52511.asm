; DESCRIPTION: Draws a black line from (450, 54) to (253, 165).
; PLAN: r0=450(x1), r1=54(y1), r2=253(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 54
LDI r2, 253
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
