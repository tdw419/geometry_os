; DESCRIPTION: Draws a blue line from (239, 104) to (78, 108).
; PLAN: r0=239(x1), r1=104(y1), r2=78(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 104
LDI r2, 78
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
