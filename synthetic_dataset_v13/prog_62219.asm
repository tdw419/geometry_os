; DESCRIPTION: Draws a white line from (367, 55) to (178, 79).
; PLAN: r0=367(x1), r1=55(y1), r2=178(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 55
LDI r2, 178
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
