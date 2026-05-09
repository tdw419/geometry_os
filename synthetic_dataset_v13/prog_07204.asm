; DESCRIPTION: Renders a magenta line between points (100, 164) and (434, 101).
; PLAN: r0=100(x1), r1=164(y1), r2=434(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 164
LDI r2, 434
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
