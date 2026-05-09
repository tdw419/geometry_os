; DESCRIPTION: Renders a yellow line between points (68, 28) and (210, 222).
; PLAN: r0=68(x1), r1=28(y1), r2=210(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 28
LDI r2, 210
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
