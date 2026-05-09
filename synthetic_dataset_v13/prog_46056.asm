; DESCRIPTION: Draws a white line from (413, 35) to (57, 37).
; PLAN: r0=413(x1), r1=35(y1), r2=57(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 35
LDI r2, 57
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
