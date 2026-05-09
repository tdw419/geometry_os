; DESCRIPTION: Draws a green line from (111, 25) to (470, 81).
; PLAN: r0=111(x1), r1=25(y1), r2=470(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 25
LDI r2, 470
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
