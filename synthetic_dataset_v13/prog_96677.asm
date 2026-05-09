; DESCRIPTION: Places a white line segment connecting (430, 239) to (350, 90).
; PLAN: r0=430(x1), r1=239(y1), r2=350(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 239
LDI r2, 350
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
