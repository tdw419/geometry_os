; DESCRIPTION: Draws a white line from (7, 79) to (456, 27).
; PLAN: r0=7(x1), r1=79(y1), r2=456(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 79
LDI r2, 456
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
