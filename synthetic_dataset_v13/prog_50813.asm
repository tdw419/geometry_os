; DESCRIPTION: Draws a yellow line from (440, 37) to (208, 9).
; PLAN: r0=440(x1), r1=37(y1), r2=208(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 37
LDI r2, 208
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
