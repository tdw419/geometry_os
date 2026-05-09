; DESCRIPTION: Draws a white line from (293, 9) to (247, 178).
; PLAN: r0=293(x1), r1=9(y1), r2=247(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 9
LDI r2, 247
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
