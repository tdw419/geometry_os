; DESCRIPTION: Renders a yellow line between points (460, 162) and (261, 127).
; PLAN: r0=460(x1), r1=162(y1), r2=261(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 162
LDI r2, 261
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
