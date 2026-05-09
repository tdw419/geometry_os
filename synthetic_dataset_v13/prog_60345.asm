; DESCRIPTION: Renders a magenta line between points (32, 178) and (278, 120).
; PLAN: r0=32(x1), r1=178(y1), r2=278(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 178
LDI r2, 278
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
