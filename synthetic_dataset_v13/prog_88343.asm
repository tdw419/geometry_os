; DESCRIPTION: Renders a yellow line between points (85, 239) and (40, 171).
; PLAN: r0=85(x1), r1=239(y1), r2=40(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 239
LDI r2, 40
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
