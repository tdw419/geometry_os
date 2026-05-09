; DESCRIPTION: Draws a yellow line from (385, 8) to (239, 160).
; PLAN: r0=385(x1), r1=8(y1), r2=239(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 8
LDI r2, 239
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
