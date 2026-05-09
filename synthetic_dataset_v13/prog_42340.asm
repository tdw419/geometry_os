; DESCRIPTION: Places a magenta line segment connecting (173, 126) to (74, 179).
; PLAN: r0=173(x1), r1=126(y1), r2=74(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 126
LDI r2, 74
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
