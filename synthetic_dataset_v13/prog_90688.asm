; DESCRIPTION: Draws a white line from (175, 75) to (275, 178).
; PLAN: r0=175(x1), r1=75(y1), r2=275(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 75
LDI r2, 275
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
