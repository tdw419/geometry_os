; DESCRIPTION: Draws a white line from (89, 135) to (496, 215).
; PLAN: r0=89(x1), r1=135(y1), r2=496(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 135
LDI r2, 496
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
