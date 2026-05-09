; DESCRIPTION: Draws a magenta line from (319, 61) to (303, 26).
; PLAN: r0=319(x1), r1=61(y1), r2=303(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 61
LDI r2, 303
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
