; DESCRIPTION: Renders a yellow line between points (465, 226) and (229, 5).
; PLAN: r0=465(x1), r1=226(y1), r2=229(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 226
LDI r2, 229
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
