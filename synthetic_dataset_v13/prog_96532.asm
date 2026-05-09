; DESCRIPTION: Renders a magenta line between points (265, 152) and (366, 32).
; PLAN: r0=265(x1), r1=152(y1), r2=366(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 152
LDI r2, 366
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
