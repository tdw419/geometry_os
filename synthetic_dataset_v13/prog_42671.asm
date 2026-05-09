; DESCRIPTION: Draws a yellow line from (310, 42) to (456, 204).
; PLAN: r0=310(x1), r1=42(y1), r2=456(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 42
LDI r2, 456
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
