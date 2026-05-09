; DESCRIPTION: Draws a white line from (116, 223) to (349, 13).
; PLAN: r0=116(x1), r1=223(y1), r2=349(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 223
LDI r2, 349
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
