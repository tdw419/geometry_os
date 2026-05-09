; DESCRIPTION: Draws a white line from (409, 175) to (96, 126).
; PLAN: r0=409(x1), r1=175(y1), r2=96(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 175
LDI r2, 96
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
