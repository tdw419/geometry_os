; DESCRIPTION: Renders a blue line between points (106, 56) and (228, 173).
; PLAN: r0=106(x1), r1=56(y1), r2=228(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 56
LDI r2, 228
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
