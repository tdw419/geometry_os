; DESCRIPTION: Places a green line segment connecting (240, 248) to (392, 122).
; PLAN: r0=240(x1), r1=248(y1), r2=392(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 248
LDI r2, 392
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
