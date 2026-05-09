; DESCRIPTION: Draws a white line from (82, 120) to (105, 160).
; PLAN: r0=82(x1), r1=120(y1), r2=105(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 120
LDI r2, 105
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
