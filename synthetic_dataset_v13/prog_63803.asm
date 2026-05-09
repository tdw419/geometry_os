; DESCRIPTION: Draws a white line from (69, 138) to (107, 133).
; PLAN: r0=69(x1), r1=138(y1), r2=107(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 138
LDI r2, 107
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
