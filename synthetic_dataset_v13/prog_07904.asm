; DESCRIPTION: Places a orange line segment connecting (362, 239) to (315, 197).
; PLAN: r0=362(x1), r1=239(y1), r2=315(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 239
LDI r2, 315
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
