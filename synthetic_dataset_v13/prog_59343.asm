; DESCRIPTION: Renders a magenta line between points (194, 105) and (173, 64).
; PLAN: r0=194(x1), r1=105(y1), r2=173(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 105
LDI r2, 173
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
