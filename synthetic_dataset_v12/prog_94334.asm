; DESCRIPTION: Draws a white line from (429, 29) to (482, 61).
; PLAN: r0=429(x1), r1=29(y1), r2=482(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 29
LDI r2, 482
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
