; DESCRIPTION: Draws a white line from (42, 149) to (24, 145).
; PLAN: r0=42(x1), r1=149(y1), r2=24(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 149
LDI r2, 24
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
