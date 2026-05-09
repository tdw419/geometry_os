; DESCRIPTION: Draws a purple line from (426, 149) to (228, 156).
; PLAN: r0=426(x1), r1=149(y1), r2=228(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 149
LDI r2, 228
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
