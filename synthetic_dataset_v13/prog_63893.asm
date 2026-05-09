; DESCRIPTION: Draws a yellow line from (122, 54) to (180, 21).
; PLAN: r0=122(x1), r1=54(y1), r2=180(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 54
LDI r2, 180
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
