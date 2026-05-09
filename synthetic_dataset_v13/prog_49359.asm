; DESCRIPTION: Renders a yellow line between points (28, 188) and (420, 150).
; PLAN: r0=28(x1), r1=188(y1), r2=420(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 188
LDI r2, 420
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
