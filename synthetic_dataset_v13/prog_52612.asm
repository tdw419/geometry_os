; DESCRIPTION: Places a magenta line segment connecting (474, 40) to (228, 184).
; PLAN: r0=474(x1), r1=40(y1), r2=228(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 40
LDI r2, 228
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
