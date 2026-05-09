; DESCRIPTION: Places a yellow line segment connecting (126, 189) to (117, 133).
; PLAN: r0=126(x1), r1=189(y1), r2=117(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 189
LDI r2, 117
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
