; DESCRIPTION: Draws a white line from (450, 236) to (285, 79).
; PLAN: r0=450(x1), r1=236(y1), r2=285(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 236
LDI r2, 285
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
