; DESCRIPTION: Places a white line segment connecting (498, 27) to (239, 110).
; PLAN: r0=498(x1), r1=27(y1), r2=239(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 27
LDI r2, 239
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
