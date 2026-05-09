; DESCRIPTION: Draws a orange line from (443, 42) to (333, 175).
; PLAN: r0=443(x1), r1=42(y1), r2=333(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 42
LDI r2, 333
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
