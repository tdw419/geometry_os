; DESCRIPTION: Draws a yellow line from (199, 67) to (19, 37).
; PLAN: r0=199(x1), r1=67(y1), r2=19(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 67
LDI r2, 19
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
