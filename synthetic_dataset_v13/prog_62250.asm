; DESCRIPTION: Draws a magenta line from (210, 107) to (491, 254).
; PLAN: r0=210(x1), r1=107(y1), r2=491(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 107
LDI r2, 491
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
