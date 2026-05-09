; DESCRIPTION: Renders a yellow line between points (59, 57) and (307, 106).
; PLAN: r0=59(x1), r1=57(y1), r2=307(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 57
LDI r2, 307
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
