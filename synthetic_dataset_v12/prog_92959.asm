; DESCRIPTION: Renders a green line between points (459, 127) and (221, 162).
; PLAN: r0=459(x1), r1=127(y1), r2=221(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 127
LDI r2, 221
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
