; DESCRIPTION: Draws a yellow line from (106, 239) to (482, 75).
; PLAN: r0=106(x1), r1=239(y1), r2=482(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 239
LDI r2, 482
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
