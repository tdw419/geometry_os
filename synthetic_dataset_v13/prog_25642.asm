; DESCRIPTION: Draws a purple line from (239, 104) to (95, 126).
; PLAN: r0=239(x1), r1=104(y1), r2=95(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 104
LDI r2, 95
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
