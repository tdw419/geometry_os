; DESCRIPTION: Draws a yellow line from (42, 75) to (45, 34).
; PLAN: r0=42(x1), r1=75(y1), r2=45(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 75
LDI r2, 45
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
