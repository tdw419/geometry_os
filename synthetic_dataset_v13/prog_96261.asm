; DESCRIPTION: Places a blue line segment connecting (433, 79) to (384, 117).
; PLAN: r0=433(x1), r1=79(y1), r2=384(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 79
LDI r2, 384
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
