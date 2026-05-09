; DESCRIPTION: Places a yellow line segment connecting (63, 210) to (470, 230).
; PLAN: r0=63(x1), r1=210(y1), r2=470(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 210
LDI r2, 470
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
