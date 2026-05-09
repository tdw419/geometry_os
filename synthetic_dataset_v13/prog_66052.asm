; DESCRIPTION: Draws a yellow line from (8, 126) to (58, 49).
; PLAN: r0=8(x1), r1=126(y1), r2=58(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 126
LDI r2, 58
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
