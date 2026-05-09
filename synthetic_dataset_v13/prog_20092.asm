; DESCRIPTION: Draws a black line from (84, 239) to (19, 60).
; PLAN: r0=84(x1), r1=239(y1), r2=19(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 239
LDI r2, 19
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
