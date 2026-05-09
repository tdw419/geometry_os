; DESCRIPTION: Renders a yellow line between points (469, 178) and (510, 66).
; PLAN: r0=469(x1), r1=178(y1), r2=510(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 178
LDI r2, 510
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
