; DESCRIPTION: Places a orange line segment connecting (328, 187) to (491, 255).
; PLAN: r0=328(x1), r1=187(y1), r2=491(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 187
LDI r2, 491
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
