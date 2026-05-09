; DESCRIPTION: Draws a white line from (255, 176) to (381, 101).
; PLAN: r0=255(x1), r1=176(y1), r2=381(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 176
LDI r2, 381
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
