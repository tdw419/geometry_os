; DESCRIPTION: Renders a magenta line between points (397, 179) and (307, 31).
; PLAN: r0=397(x1), r1=179(y1), r2=307(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 179
LDI r2, 307
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
