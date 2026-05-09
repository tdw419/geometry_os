; DESCRIPTION: Places a magenta line segment connecting (134, 189) to (482, 113).
; PLAN: r0=134(x1), r1=189(y1), r2=482(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 189
LDI r2, 482
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
