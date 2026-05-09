; DESCRIPTION: Renders a magenta line between points (231, 40) and (392, 82).
; PLAN: r0=231(x1), r1=40(y1), r2=392(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 40
LDI r2, 392
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
