; DESCRIPTION: Renders a magenta line between points (231, 126) and (379, 160).
; PLAN: r0=231(x1), r1=126(y1), r2=379(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 126
LDI r2, 379
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
