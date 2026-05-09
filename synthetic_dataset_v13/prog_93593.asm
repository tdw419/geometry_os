; DESCRIPTION: Draws a magenta line from (461, 149) to (507, 114).
; PLAN: r0=461(x1), r1=149(y1), r2=507(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 149
LDI r2, 507
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
