; DESCRIPTION: Renders a yellow line between points (460, 251) and (176, 225).
; PLAN: r0=460(x1), r1=251(y1), r2=176(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 251
LDI r2, 176
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
