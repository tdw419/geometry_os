; DESCRIPTION: Draws a white line from (462, 109) to (388, 55).
; PLAN: r0=462(x1), r1=109(y1), r2=388(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 109
LDI r2, 388
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
