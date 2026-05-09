; DESCRIPTION: Draws a purple line from (90, 239) to (198, 221).
; PLAN: r0=90(x1), r1=239(y1), r2=198(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 239
LDI r2, 198
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
