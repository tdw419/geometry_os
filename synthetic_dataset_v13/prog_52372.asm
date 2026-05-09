; DESCRIPTION: Draws a white line from (486, 160) to (120, 253).
; PLAN: r0=486(x1), r1=160(y1), r2=120(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 160
LDI r2, 120
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
