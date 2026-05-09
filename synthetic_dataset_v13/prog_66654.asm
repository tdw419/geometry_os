; DESCRIPTION: Draws a white line from (247, 230) to (35, 31).
; PLAN: r0=247(x1), r1=230(y1), r2=35(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 230
LDI r2, 35
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
