; DESCRIPTION: Draws a white line from (255, 64) to (483, 251).
; PLAN: r0=255(x1), r1=64(y1), r2=483(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 64
LDI r2, 483
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
