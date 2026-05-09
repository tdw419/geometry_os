; DESCRIPTION: Places a magenta line segment connecting (461, 173) to (385, 120).
; PLAN: r0=461(x1), r1=173(y1), r2=385(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 173
LDI r2, 385
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
