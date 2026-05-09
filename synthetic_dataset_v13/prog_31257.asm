; DESCRIPTION: Draws a white line from (23, 188) to (188, 57).
; PLAN: r0=23(x1), r1=188(y1), r2=188(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 188
LDI r2, 188
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
