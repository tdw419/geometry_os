; DESCRIPTION: Draws a white line from (177, 190) to (465, 205).
; PLAN: r0=177(x1), r1=190(y1), r2=465(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 190
LDI r2, 465
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
