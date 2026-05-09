; DESCRIPTION: Draws a blue line from (395, 239) to (166, 170).
; PLAN: r0=395(x1), r1=239(y1), r2=166(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 239
LDI r2, 166
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
