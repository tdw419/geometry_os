; DESCRIPTION: Draws a white line from (187, 168) to (454, 45).
; PLAN: r0=187(x1), r1=168(y1), r2=454(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 168
LDI r2, 454
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
