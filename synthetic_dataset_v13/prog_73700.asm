; DESCRIPTION: Places a yellow line segment connecting (276, 27) to (449, 121).
; PLAN: r0=276(x1), r1=27(y1), r2=449(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 27
LDI r2, 449
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
