; DESCRIPTION: Places a magenta line segment connecting (42, 116) to (403, 201).
; PLAN: r0=42(x1), r1=116(y1), r2=403(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 116
LDI r2, 403
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
