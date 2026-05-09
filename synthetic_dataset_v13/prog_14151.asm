; DESCRIPTION: Renders a magenta line between points (510, 105) and (173, 180).
; PLAN: r0=510(x1), r1=105(y1), r2=173(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 105
LDI r2, 173
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
