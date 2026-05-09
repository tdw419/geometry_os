; DESCRIPTION: Draws a yellow line from (167, 230) to (220, 244).
; PLAN: r0=167(x1), r1=230(y1), r2=220(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 230
LDI r2, 220
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
