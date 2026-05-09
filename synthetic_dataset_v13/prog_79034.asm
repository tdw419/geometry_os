; DESCRIPTION: Renders a yellow line between points (240, 222) and (127, 79).
; PLAN: r0=240(x1), r1=222(y1), r2=127(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 222
LDI r2, 127
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
