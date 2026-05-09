; DESCRIPTION: Draws a yellow line from (46, 211) to (493, 237).
; PLAN: r0=46(x1), r1=211(y1), r2=493(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 211
LDI r2, 493
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
