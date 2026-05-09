; DESCRIPTION: Draws a yellow line from (330, 171) to (17, 4).
; PLAN: r0=330(x1), r1=171(y1), r2=17(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 171
LDI r2, 17
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
