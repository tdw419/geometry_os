; DESCRIPTION: Renders a yellow line between points (96, 127) and (510, 214).
; PLAN: r0=96(x1), r1=127(y1), r2=510(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 127
LDI r2, 510
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
