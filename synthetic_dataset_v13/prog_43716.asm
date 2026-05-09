; DESCRIPTION: Draws a white line from (299, 173) to (286, 252).
; PLAN: r0=299(x1), r1=173(y1), r2=286(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 173
LDI r2, 286
LDI r3, 252
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
