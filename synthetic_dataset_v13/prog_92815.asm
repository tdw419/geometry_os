; DESCRIPTION: Draws a yellow line from (62, 129) to (180, 24).
; PLAN: r0=62(x1), r1=129(y1), r2=180(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 129
LDI r2, 180
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
