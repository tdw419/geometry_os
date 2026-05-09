; DESCRIPTION: Renders a green line between points (222, 90) and (121, 125).
; PLAN: r0=222(x1), r1=90(y1), r2=121(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 90
LDI r2, 121
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
