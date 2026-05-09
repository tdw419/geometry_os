; DESCRIPTION: Draws a white line from (171, 34) to (69, 57).
; PLAN: r0=171(x1), r1=34(y1), r2=69(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 34
LDI r2, 69
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
