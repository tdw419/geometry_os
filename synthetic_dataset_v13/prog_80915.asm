; DESCRIPTION: Places a white line segment connecting (17, 59) to (218, 224).
; PLAN: r0=17(x1), r1=59(y1), r2=218(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 59
LDI r2, 218
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
