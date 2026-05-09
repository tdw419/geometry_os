; DESCRIPTION: Draws a white line from (318, 120) to (207, 192).
; PLAN: r0=318(x1), r1=120(y1), r2=207(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 120
LDI r2, 207
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
