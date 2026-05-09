; DESCRIPTION: Draws a magenta line from (233, 25) to (511, 213).
; PLAN: r0=233(x1), r1=25(y1), r2=511(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 25
LDI r2, 511
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
