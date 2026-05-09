; DESCRIPTION: Draws a white line from (134, 209) to (143, 83).
; PLAN: r0=134(x1), r1=209(y1), r2=143(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 209
LDI r2, 143
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
