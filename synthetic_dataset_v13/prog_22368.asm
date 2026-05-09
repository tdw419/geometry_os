; DESCRIPTION: Draws a white line from (268, 122) to (164, 108).
; PLAN: r0=268(x1), r1=122(y1), r2=164(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 122
LDI r2, 164
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
