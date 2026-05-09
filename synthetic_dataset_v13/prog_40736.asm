; DESCRIPTION: Renders a magenta line between points (458, 185) and (173, 135).
; PLAN: r0=458(x1), r1=185(y1), r2=173(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 185
LDI r2, 173
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
