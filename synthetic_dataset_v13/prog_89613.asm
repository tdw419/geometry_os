; DESCRIPTION: Renders a magenta line between points (61, 215) and (56, 128).
; PLAN: r0=61(x1), r1=215(y1), r2=56(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 215
LDI r2, 56
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
