; DESCRIPTION: Draws a white line from (394, 134) to (80, 58).
; PLAN: r0=394(x1), r1=134(y1), r2=80(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 134
LDI r2, 80
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
