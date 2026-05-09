; DESCRIPTION: Draws a white line from (255, 20) to (234, 23).
; PLAN: r0=255(x1), r1=20(y1), r2=234(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 20
LDI r2, 234
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
