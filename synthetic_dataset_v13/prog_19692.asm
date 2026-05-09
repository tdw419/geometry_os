; DESCRIPTION: Draws a green line from (477, 57) to (510, 78).
; PLAN: r0=477(x1), r1=57(y1), r2=510(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 57
LDI r2, 510
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
