; DESCRIPTION: Draws a cyan line from (188, 254) to (155, 88).
; PLAN: r0=188(x1), r1=254(y1), r2=155(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 254
LDI r2, 155
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
