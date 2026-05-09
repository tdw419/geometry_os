; DESCRIPTION: Places a magenta line segment connecting (121, 159) to (458, 167).
; PLAN: r0=121(x1), r1=159(y1), r2=458(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 159
LDI r2, 458
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
