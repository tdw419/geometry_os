; DESCRIPTION: Draws a yellow line from (470, 196) to (105, 94).
; PLAN: r0=470(x1), r1=196(y1), r2=105(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 196
LDI r2, 105
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
