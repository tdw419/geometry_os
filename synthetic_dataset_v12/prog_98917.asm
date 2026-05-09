; DESCRIPTION: Draws a yellow line from (324, 187) to (237, 209).
; PLAN: r0=324(x1), r1=187(y1), r2=237(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 187
LDI r2, 237
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
