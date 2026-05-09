; DESCRIPTION: Renders a yellow line between points (309, 226) and (236, 234).
; PLAN: r0=309(x1), r1=226(y1), r2=236(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 226
LDI r2, 236
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
