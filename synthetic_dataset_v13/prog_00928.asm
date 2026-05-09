; DESCRIPTION: Places a orange line segment connecting (328, 255) to (340, 166).
; PLAN: r0=328(x1), r1=255(y1), r2=340(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 255
LDI r2, 340
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
