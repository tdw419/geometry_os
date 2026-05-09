; DESCRIPTION: Draws a white line from (183, 211) to (332, 46).
; PLAN: r0=183(x1), r1=211(y1), r2=332(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 211
LDI r2, 332
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
