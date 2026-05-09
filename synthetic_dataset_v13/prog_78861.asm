; DESCRIPTION: Renders a yellow line between points (464, 175) and (247, 47).
; PLAN: r0=464(x1), r1=175(y1), r2=247(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 175
LDI r2, 247
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
