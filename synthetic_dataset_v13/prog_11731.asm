; DESCRIPTION: Places a magenta line segment connecting (173, 135) to (38, 165).
; PLAN: r0=173(x1), r1=135(y1), r2=38(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 135
LDI r2, 38
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
