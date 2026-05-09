; DESCRIPTION: Draws a white line from (218, 89) to (255, 74).
; PLAN: r0=218(x1), r1=89(y1), r2=255(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 89
LDI r2, 255
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
