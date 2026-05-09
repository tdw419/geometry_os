; DESCRIPTION: Renders a yellow line between points (234, 144) and (213, 132).
; PLAN: r0=234(x1), r1=144(y1), r2=213(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 144
LDI r2, 213
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
