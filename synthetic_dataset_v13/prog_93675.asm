; DESCRIPTION: Draws a white line from (389, 28) to (168, 106).
; PLAN: r0=389(x1), r1=28(y1), r2=168(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 28
LDI r2, 168
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
