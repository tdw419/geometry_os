; DESCRIPTION: Renders a yellow line between points (420, 149) and (125, 7).
; PLAN: r0=420(x1), r1=149(y1), r2=125(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 149
LDI r2, 125
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
