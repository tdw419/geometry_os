; DESCRIPTION: Draws a yellow line from (49, 220) to (510, 33).
; PLAN: r0=49(x1), r1=220(y1), r2=510(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 220
LDI r2, 510
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
