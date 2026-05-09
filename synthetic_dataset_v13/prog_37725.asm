; DESCRIPTION: Places a white line segment connecting (217, 214) to (219, 3).
; PLAN: r0=217(x1), r1=214(y1), r2=219(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 214
LDI r2, 219
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
