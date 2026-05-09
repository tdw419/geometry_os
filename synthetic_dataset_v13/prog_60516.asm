; DESCRIPTION: Draws a yellow line from (135, 220) to (256, 52).
; PLAN: r0=135(x1), r1=220(y1), r2=256(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 220
LDI r2, 256
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
