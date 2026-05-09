; DESCRIPTION: Renders a yellow line between points (285, 239) and (117, 185).
; PLAN: r0=285(x1), r1=239(y1), r2=117(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 239
LDI r2, 117
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
