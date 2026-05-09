; DESCRIPTION: Renders a yellow line between points (349, 239) and (299, 105).
; PLAN: r0=349(x1), r1=239(y1), r2=299(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 239
LDI r2, 299
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
