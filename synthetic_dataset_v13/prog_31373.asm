; DESCRIPTION: Places a magenta line segment connecting (387, 255) to (280, 131).
; PLAN: r0=387(x1), r1=255(y1), r2=280(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 255
LDI r2, 280
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
