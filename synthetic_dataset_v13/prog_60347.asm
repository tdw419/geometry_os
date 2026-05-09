; DESCRIPTION: Draws a yellow line from (320, 102) to (17, 124).
; PLAN: r0=320(x1), r1=102(y1), r2=17(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 102
LDI r2, 17
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
