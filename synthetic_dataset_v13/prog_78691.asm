; DESCRIPTION: Renders a purple line between points (168, 175) and (59, 103).
; PLAN: r0=168(x1), r1=175(y1), r2=59(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 175
LDI r2, 59
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
