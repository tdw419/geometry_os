; DESCRIPTION: Draws a white line from (16, 8) to (332, 218).
; PLAN: r0=16(x1), r1=8(y1), r2=332(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 8
LDI r2, 332
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
