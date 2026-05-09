; DESCRIPTION: Renders a magenta line between points (173, 164) and (325, 74).
; PLAN: r0=173(x1), r1=164(y1), r2=325(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 164
LDI r2, 325
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
