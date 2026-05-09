; DESCRIPTION: Draws a yellow line from (506, 38) to (428, 21).
; PLAN: r0=506(x1), r1=38(y1), r2=428(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 38
LDI r2, 428
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
