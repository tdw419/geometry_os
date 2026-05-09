; DESCRIPTION: Places a black line segment connecting (374, 79) to (280, 98).
; PLAN: r0=374(x1), r1=79(y1), r2=280(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 79
LDI r2, 280
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
