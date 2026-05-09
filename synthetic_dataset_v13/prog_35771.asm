; DESCRIPTION: Places a magenta line segment connecting (305, 189) to (442, 220).
; PLAN: r0=305(x1), r1=189(y1), r2=442(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 189
LDI r2, 442
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
