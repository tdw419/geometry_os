; DESCRIPTION: Places a yellow line segment connecting (385, 234) to (395, 239).
; PLAN: r0=385(x1), r1=234(y1), r2=395(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 234
LDI r2, 395
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
