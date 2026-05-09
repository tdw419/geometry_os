; DESCRIPTION: Draws a white line from (193, 35) to (98, 67).
; PLAN: r0=193(x1), r1=35(y1), r2=98(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 35
LDI r2, 98
LDI r3, 67
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
