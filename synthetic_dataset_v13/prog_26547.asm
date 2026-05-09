; DESCRIPTION: Draws a yellow line from (186, 20) to (220, 178).
; PLAN: r0=186(x1), r1=20(y1), r2=220(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 20
LDI r2, 220
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
