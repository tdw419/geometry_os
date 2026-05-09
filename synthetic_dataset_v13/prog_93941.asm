; DESCRIPTION: Draws a white line from (209, 77) to (450, 194).
; PLAN: r0=209(x1), r1=77(y1), r2=450(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 77
LDI r2, 450
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
