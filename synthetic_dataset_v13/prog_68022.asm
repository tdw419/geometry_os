; DESCRIPTION: Places a magenta line segment connecting (504, 7) to (450, 5).
; PLAN: r0=504(x1), r1=7(y1), r2=450(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 7
LDI r2, 450
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
