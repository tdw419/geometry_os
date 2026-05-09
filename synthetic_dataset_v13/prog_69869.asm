; DESCRIPTION: Draws a white line from (48, 191) to (183, 83).
; PLAN: r0=48(x1), r1=191(y1), r2=183(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 191
LDI r2, 183
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
