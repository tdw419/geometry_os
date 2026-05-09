; DESCRIPTION: Places a black line segment connecting (408, 234) to (239, 255).
; PLAN: r0=408(x1), r1=234(y1), r2=239(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 234
LDI r2, 239
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
