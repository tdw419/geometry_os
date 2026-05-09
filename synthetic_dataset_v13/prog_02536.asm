; DESCRIPTION: Draws a purple line from (27, 208) to (96, 225).
; PLAN: r0=27(x1), r1=208(y1), r2=96(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 208
LDI r2, 96
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
