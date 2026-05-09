; DESCRIPTION: Places a magenta line segment connecting (244, 171) to (42, 152).
; PLAN: r0=244(x1), r1=171(y1), r2=42(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 171
LDI r2, 42
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
