; DESCRIPTION: Draws a white line from (125, 82) to (92, 54).
; PLAN: r0=125(x1), r1=82(y1), r2=92(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 82
LDI r2, 92
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
