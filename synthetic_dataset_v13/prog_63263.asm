; DESCRIPTION: Places a magenta line segment connecting (404, 76) to (356, 225).
; PLAN: r0=404(x1), r1=76(y1), r2=356(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 76
LDI r2, 356
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
