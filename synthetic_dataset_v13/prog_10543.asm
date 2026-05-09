; DESCRIPTION: Draws a green line from (116, 57) to (46, 181).
; PLAN: r0=116(x1), r1=57(y1), r2=46(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 57
LDI r2, 46
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
