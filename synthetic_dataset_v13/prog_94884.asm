; DESCRIPTION: Renders a yellow line between points (17, 146) and (501, 125).
; PLAN: r0=17(x1), r1=146(y1), r2=501(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 146
LDI r2, 501
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
