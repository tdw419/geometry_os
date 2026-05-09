; DESCRIPTION: Draws a white line from (174, 37) to (245, 61).
; PLAN: r0=174(x1), r1=37(y1), r2=245(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 37
LDI r2, 245
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
