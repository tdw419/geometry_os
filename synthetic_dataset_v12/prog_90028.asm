; DESCRIPTION: Draws a red line from (120, 211) to (354, 65).
; PLAN: r0=120(x1), r1=211(y1), r2=354(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 211
LDI r2, 354
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
