; DESCRIPTION: Draws a red line from (445, 17) to (49, 176).
; PLAN: r0=445(x1), r1=17(y1), r2=49(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 17
LDI r2, 49
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
