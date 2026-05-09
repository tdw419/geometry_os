; DESCRIPTION: Draws a yellow line from (500, 237) to (373, 32).
; PLAN: r0=500(x1), r1=237(y1), r2=373(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 237
LDI r2, 373
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
