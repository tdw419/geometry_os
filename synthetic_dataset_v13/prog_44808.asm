; DESCRIPTION: Draws a yellow line from (279, 203) to (208, 237).
; PLAN: r0=279(x1), r1=203(y1), r2=208(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 203
LDI r2, 208
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
