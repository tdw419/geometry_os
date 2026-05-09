; DESCRIPTION: Renders a magenta line between points (397, 96) and (361, 203).
; PLAN: r0=397(x1), r1=96(y1), r2=361(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 96
LDI r2, 361
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
