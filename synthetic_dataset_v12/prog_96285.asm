; DESCRIPTION: Draws a orange line from (230, 239) to (96, 137).
; PLAN: r0=230(x1), r1=239(y1), r2=96(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 239
LDI r2, 96
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
