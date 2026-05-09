; DESCRIPTION: Draws a white line from (109, 54) to (510, 8).
; PLAN: r0=109(x1), r1=54(y1), r2=510(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 54
LDI r2, 510
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
