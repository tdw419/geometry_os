; DESCRIPTION: Places a black line segment connecting (328, 174) to (35, 150).
; PLAN: r0=328(x1), r1=174(y1), r2=35(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 174
LDI r2, 35
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
