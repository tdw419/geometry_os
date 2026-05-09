; DESCRIPTION: Draws a white line from (436, 190) to (290, 5).
; PLAN: r0=436(x1), r1=190(y1), r2=290(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 190
LDI r2, 290
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
