; DESCRIPTION: Places a magenta line segment connecting (239, 104) to (442, 65).
; PLAN: r0=239(x1), r1=104(y1), r2=442(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 104
LDI r2, 442
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
