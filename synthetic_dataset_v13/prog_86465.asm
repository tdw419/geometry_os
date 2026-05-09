; DESCRIPTION: Places a yellow line segment connecting (215, 138) to (449, 56).
; PLAN: r0=215(x1), r1=138(y1), r2=449(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 138
LDI r2, 449
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
