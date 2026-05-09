; DESCRIPTION: Places a magenta line segment connecting (245, 135) to (439, 239).
; PLAN: r0=245(x1), r1=135(y1), r2=439(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 135
LDI r2, 439
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
