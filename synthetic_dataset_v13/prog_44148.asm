; DESCRIPTION: Places a magenta line segment connecting (141, 125) to (170, 182).
; PLAN: r0=141(x1), r1=125(y1), r2=170(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 125
LDI r2, 170
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
