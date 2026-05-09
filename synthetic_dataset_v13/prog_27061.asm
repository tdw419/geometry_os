; DESCRIPTION: Draws a white line from (25, 134) to (254, 98).
; PLAN: r0=25(x1), r1=134(y1), r2=254(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 134
LDI r2, 254
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
