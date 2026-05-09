; DESCRIPTION: Draws a yellow line from (120, 87) to (151, 18).
; PLAN: r0=120(x1), r1=87(y1), r2=151(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 87
LDI r2, 151
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
