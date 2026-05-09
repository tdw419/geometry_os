; DESCRIPTION: Places a magenta line segment connecting (511, 94) to (213, 143).
; PLAN: r0=511(x1), r1=94(y1), r2=213(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 94
LDI r2, 213
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
