; DESCRIPTION: Draws a yellow line from (375, 247) to (82, 120).
; PLAN: r0=375(x1), r1=247(y1), r2=82(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 247
LDI r2, 82
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
