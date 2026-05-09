; DESCRIPTION: Draws a green line from (381, 92) to (174, 223).
; PLAN: r0=381(x1), r1=92(y1), r2=174(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 92
LDI r2, 174
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
