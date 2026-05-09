; DESCRIPTION: Places a magenta line segment connecting (239, 102) to (141, 164).
; PLAN: r0=239(x1), r1=102(y1), r2=141(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 102
LDI r2, 141
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
