; DESCRIPTION: Renders a yellow line between points (255, 54) and (307, 159).
; PLAN: r0=255(x1), r1=54(y1), r2=307(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 54
LDI r2, 307
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
