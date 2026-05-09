; DESCRIPTION: Draws a yellow line from (67, 91) to (436, 191).
; PLAN: r0=67(x1), r1=91(y1), r2=436(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 91
LDI r2, 436
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
