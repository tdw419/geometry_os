; DESCRIPTION: Draws a green line from (427, 209) to (256, 94).
; PLAN: r0=427(x1), r1=209(y1), r2=256(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 209
LDI r2, 256
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
