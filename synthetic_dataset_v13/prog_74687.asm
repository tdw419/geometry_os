; DESCRIPTION: Draws a yellow line from (445, 141) to (454, 26).
; PLAN: r0=445(x1), r1=141(y1), r2=454(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 141
LDI r2, 454
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
