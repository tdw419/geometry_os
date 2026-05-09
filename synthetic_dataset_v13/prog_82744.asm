; DESCRIPTION: Draws a white line from (417, 190) to (428, 244).
; PLAN: r0=417(x1), r1=190(y1), r2=428(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 190
LDI r2, 428
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
