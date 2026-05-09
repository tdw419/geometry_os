; DESCRIPTION: Places a magenta line segment connecting (474, 202) to (499, 134).
; PLAN: r0=474(x1), r1=202(y1), r2=499(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 202
LDI r2, 499
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
