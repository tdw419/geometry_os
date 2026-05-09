; DESCRIPTION: Places a magenta line segment connecting (299, 165) to (229, 55).
; PLAN: r0=299(x1), r1=165(y1), r2=229(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 165
LDI r2, 229
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
