; DESCRIPTION: Draws a yellow line from (385, 46) to (278, 221).
; PLAN: r0=385(x1), r1=46(y1), r2=278(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 46
LDI r2, 278
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
