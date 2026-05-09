; DESCRIPTION: Places a magenta line segment connecting (340, 82) to (254, 67).
; PLAN: r0=340(x1), r1=82(y1), r2=254(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 82
LDI r2, 254
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
