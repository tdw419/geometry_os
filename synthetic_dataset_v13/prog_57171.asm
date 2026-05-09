; DESCRIPTION: Draws a yellow line from (449, 224) to (386, 155).
; PLAN: r0=449(x1), r1=224(y1), r2=386(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 224
LDI r2, 386
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
