; DESCRIPTION: Draws a white line from (406, 105) to (413, 209).
; PLAN: r0=406(x1), r1=105(y1), r2=413(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 105
LDI r2, 413
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
