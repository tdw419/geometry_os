; DESCRIPTION: Draws a white line from (35, 19) to (468, 170).
; PLAN: r0=35(x1), r1=19(y1), r2=468(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 19
LDI r2, 468
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
