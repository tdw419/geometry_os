; DESCRIPTION: Draws a white line from (193, 167) to (108, 69).
; PLAN: r0=193(x1), r1=167(y1), r2=108(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 167
LDI r2, 108
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
