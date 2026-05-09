; DESCRIPTION: Draws a white line from (215, 55) to (290, 233).
; PLAN: r0=215(x1), r1=55(y1), r2=290(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 55
LDI r2, 290
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
