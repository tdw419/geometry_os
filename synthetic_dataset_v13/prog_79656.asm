; DESCRIPTION: Places a magenta line segment connecting (116, 143) to (364, 150).
; PLAN: r0=116(x1), r1=143(y1), r2=364(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 143
LDI r2, 364
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
