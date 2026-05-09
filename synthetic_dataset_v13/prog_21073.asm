; DESCRIPTION: Draws a yellow line from (420, 26) to (7, 180).
; PLAN: r0=420(x1), r1=26(y1), r2=7(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 26
LDI r2, 7
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
