; DESCRIPTION: Renders a yellow line between points (176, 121) and (59, 248).
; PLAN: r0=176(x1), r1=121(y1), r2=59(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 121
LDI r2, 59
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
