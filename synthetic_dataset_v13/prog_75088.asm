; DESCRIPTION: Renders a magenta line between points (182, 52) and (397, 127).
; PLAN: r0=182(x1), r1=52(y1), r2=397(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 52
LDI r2, 397
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
