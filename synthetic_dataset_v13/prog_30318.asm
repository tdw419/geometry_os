; DESCRIPTION: Places a black line segment connecting (320, 15) to (162, 50).
; PLAN: r0=320(x1), r1=15(y1), r2=162(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 15
LDI r2, 162
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
