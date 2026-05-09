; DESCRIPTION: Draws a black line from (254, 21) to (220, 104).
; PLAN: r0=254(x1), r1=21(y1), r2=220(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 21
LDI r2, 220
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
