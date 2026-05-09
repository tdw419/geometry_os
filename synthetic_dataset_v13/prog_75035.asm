; DESCRIPTION: Draws a white line from (150, 251) to (226, 30).
; PLAN: r0=150(x1), r1=251(y1), r2=226(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 251
LDI r2, 226
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
