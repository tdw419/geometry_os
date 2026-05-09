; DESCRIPTION: Draws a white line from (254, 213) to (151, 106).
; PLAN: r0=254(x1), r1=213(y1), r2=151(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 213
LDI r2, 151
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
