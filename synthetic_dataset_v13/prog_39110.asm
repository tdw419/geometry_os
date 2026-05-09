; DESCRIPTION: Renders a yellow line between points (289, 230) and (173, 84).
; PLAN: r0=289(x1), r1=230(y1), r2=173(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 230
LDI r2, 173
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
