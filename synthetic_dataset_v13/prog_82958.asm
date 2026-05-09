; DESCRIPTION: Draws a yellow line from (42, 206) to (310, 247).
; PLAN: r0=42(x1), r1=206(y1), r2=310(x2), r3=247(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 206
LDI r2, 310
LDI r3, 247
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
