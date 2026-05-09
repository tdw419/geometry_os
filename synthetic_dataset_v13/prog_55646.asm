; DESCRIPTION: Renders a purple line between points (197, 96) and (234, 196).
; PLAN: r0=197(x1), r1=96(y1), r2=234(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 96
LDI r2, 234
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
