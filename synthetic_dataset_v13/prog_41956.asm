; DESCRIPTION: Places a magenta line segment connecting (294, 152) to (450, 179).
; PLAN: r0=294(x1), r1=152(y1), r2=450(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 152
LDI r2, 450
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
