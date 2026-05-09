; DESCRIPTION: Draws a white line from (427, 240) to (294, 149).
; PLAN: r0=427(x1), r1=240(y1), r2=294(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 240
LDI r2, 294
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
