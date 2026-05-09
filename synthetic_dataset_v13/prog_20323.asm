; DESCRIPTION: Draws a white line from (183, 237) to (328, 165).
; PLAN: r0=183(x1), r1=237(y1), r2=328(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 237
LDI r2, 328
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
