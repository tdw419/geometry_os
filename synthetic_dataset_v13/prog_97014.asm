; DESCRIPTION: Renders a magenta line between points (115, 64) and (268, 76).
; PLAN: r0=115(x1), r1=64(y1), r2=268(x2), r3=76(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 64
LDI r2, 268
LDI r3, 76
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
