; DESCRIPTION: Draws a yellow line from (328, 36) to (91, 62).
; PLAN: r0=328(x1), r1=36(y1), r2=91(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 36
LDI r2, 91
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
