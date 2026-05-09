; DESCRIPTION: Places a white line segment connecting (440, 98) to (218, 40).
; PLAN: r0=440(x1), r1=98(y1), r2=218(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 98
LDI r2, 218
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
