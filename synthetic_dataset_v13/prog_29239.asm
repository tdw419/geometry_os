; DESCRIPTION: Renders a yellow line between points (239, 151) and (188, 169).
; PLAN: r0=239(x1), r1=151(y1), r2=188(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 151
LDI r2, 188
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
