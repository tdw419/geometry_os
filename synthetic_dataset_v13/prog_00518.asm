; DESCRIPTION: Draws a white line from (276, 116) to (294, 72).
; PLAN: r0=276(x1), r1=116(y1), r2=294(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 116
LDI r2, 294
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
