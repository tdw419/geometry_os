; DESCRIPTION: Draws a yellow line from (203, 104) to (213, 226).
; PLAN: r0=203(x1), r1=104(y1), r2=213(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 104
LDI r2, 213
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
