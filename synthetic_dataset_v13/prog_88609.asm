; DESCRIPTION: Places a magenta line segment connecting (255, 85) to (116, 239).
; PLAN: r0=255(x1), r1=85(y1), r2=116(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 85
LDI r2, 116
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
