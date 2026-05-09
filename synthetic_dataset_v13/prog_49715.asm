; DESCRIPTION: Draws a yellow line from (347, 126) to (167, 54).
; PLAN: r0=347(x1), r1=126(y1), r2=167(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 126
LDI r2, 167
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
