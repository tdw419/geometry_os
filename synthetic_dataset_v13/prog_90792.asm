; DESCRIPTION: Draws a white line from (120, 161) to (122, 32).
; PLAN: r0=120(x1), r1=161(y1), r2=122(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 161
LDI r2, 122
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
