; DESCRIPTION: Renders a magenta line between points (173, 178) and (56, 197).
; PLAN: r0=173(x1), r1=178(y1), r2=56(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 178
LDI r2, 56
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
