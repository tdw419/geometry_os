; DESCRIPTION: Draws a yellow line from (114, 42) to (305, 185).
; PLAN: r0=114(x1), r1=42(y1), r2=305(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 42
LDI r2, 305
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
