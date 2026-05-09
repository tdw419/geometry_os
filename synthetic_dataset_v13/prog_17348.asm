; DESCRIPTION: Draws a white line from (385, 72) to (106, 253).
; PLAN: r0=385(x1), r1=72(y1), r2=106(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 72
LDI r2, 106
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
