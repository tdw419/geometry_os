; DESCRIPTION: Draws a black line from (364, 220) to (103, 78).
; PLAN: r0=364(x1), r1=220(y1), r2=103(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 220
LDI r2, 103
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
