; DESCRIPTION: Draws a yellow line from (435, 180) to (265, 188).
; PLAN: r0=435(x1), r1=180(y1), r2=265(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 180
LDI r2, 265
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
