; DESCRIPTION: Places a magenta line segment connecting (239, 174) to (299, 247).
; PLAN: r0=239(x1), r1=174(y1), r2=299(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 174
LDI r2, 299
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
