; DESCRIPTION: Draws a white line from (468, 15) to (406, 71).
; PLAN: r0=468(x1), r1=15(y1), r2=406(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 15
LDI r2, 406
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
