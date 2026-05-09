; DESCRIPTION: Places a magenta line segment connecting (126, 143) to (237, 28).
; PLAN: r0=126(x1), r1=143(y1), r2=237(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 143
LDI r2, 237
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
