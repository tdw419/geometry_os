; DESCRIPTION: Renders a yellow line between points (259, 150) and (39, 127).
; PLAN: r0=259(x1), r1=150(y1), r2=39(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 150
LDI r2, 39
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
