; DESCRIPTION: Draws a white line from (509, 105) to (278, 220).
; PLAN: r0=509(x1), r1=105(y1), r2=278(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 105
LDI r2, 278
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
