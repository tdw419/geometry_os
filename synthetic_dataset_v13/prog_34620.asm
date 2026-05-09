; DESCRIPTION: Draws a green line from (449, 78) to (459, 17).
; PLAN: r0=449(x1), r1=78(y1), r2=459(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 78
LDI r2, 459
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
