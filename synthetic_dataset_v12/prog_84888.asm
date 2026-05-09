; DESCRIPTION: Draws a white line from (319, 133) to (28, 178).
; PLAN: r0=319(x1), r1=133(y1), r2=28(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 133
LDI r2, 28
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
