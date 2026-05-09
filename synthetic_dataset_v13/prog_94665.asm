; DESCRIPTION: Draws a yellow line from (233, 210) to (470, 249).
; PLAN: r0=233(x1), r1=210(y1), r2=470(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 210
LDI r2, 470
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
