; DESCRIPTION: Renders a magenta line between points (471, 228) and (173, 90).
; PLAN: r0=471(x1), r1=228(y1), r2=173(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 228
LDI r2, 173
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
