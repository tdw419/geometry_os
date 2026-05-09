; DESCRIPTION: Places a magenta line segment connecting (474, 103) to (295, 169).
; PLAN: r0=474(x1), r1=103(y1), r2=295(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 103
LDI r2, 295
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
