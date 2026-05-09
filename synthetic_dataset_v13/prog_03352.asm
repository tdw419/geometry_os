; DESCRIPTION: Places a orange line segment connecting (239, 255) to (435, 17).
; PLAN: r0=239(x1), r1=255(y1), r2=435(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 255
LDI r2, 435
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
