; DESCRIPTION: Draws a yellow line from (230, 200) to (213, 33).
; PLAN: r0=230(x1), r1=200(y1), r2=213(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 200
LDI r2, 213
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
