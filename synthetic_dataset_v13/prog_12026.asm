; DESCRIPTION: Draws a white line from (224, 19) to (361, 54).
; PLAN: r0=224(x1), r1=19(y1), r2=361(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 19
LDI r2, 361
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
