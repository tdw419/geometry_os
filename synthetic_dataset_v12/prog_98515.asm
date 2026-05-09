; DESCRIPTION: Places a white line segment connecting (395, 239) to (270, 140).
; PLAN: r0=395(x1), r1=239(y1), r2=270(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 239
LDI r2, 270
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
