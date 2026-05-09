; DESCRIPTION: Renders a yellow line between points (468, 60) and (213, 229).
; PLAN: r0=468(x1), r1=60(y1), r2=213(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 60
LDI r2, 213
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
