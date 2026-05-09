; DESCRIPTION: Draws a yellow line from (55, 42) to (33, 28).
; PLAN: r0=55(x1), r1=42(y1), r2=33(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 42
LDI r2, 33
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
