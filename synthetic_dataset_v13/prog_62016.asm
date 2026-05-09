; DESCRIPTION: Draws a yellow line from (209, 136) to (12, 237).
; PLAN: r0=209(x1), r1=136(y1), r2=12(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 136
LDI r2, 12
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
