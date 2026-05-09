; DESCRIPTION: Places a yellow line segment connecting (232, 151) to (345, 213).
; PLAN: r0=232(x1), r1=151(y1), r2=345(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 151
LDI r2, 345
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
