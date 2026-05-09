; DESCRIPTION: Draws a white line from (381, 66) to (156, 64).
; PLAN: r0=381(x1), r1=66(y1), r2=156(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 66
LDI r2, 156
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
