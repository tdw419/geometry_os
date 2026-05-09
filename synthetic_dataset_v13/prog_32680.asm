; DESCRIPTION: Draws a white line from (440, 218) to (285, 40).
; PLAN: r0=440(x1), r1=218(y1), r2=285(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 218
LDI r2, 285
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
