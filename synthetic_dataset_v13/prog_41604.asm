; DESCRIPTION: Draws a purple line from (275, 239) to (269, 7).
; PLAN: r0=275(x1), r1=239(y1), r2=269(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 239
LDI r2, 269
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
