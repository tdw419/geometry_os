; DESCRIPTION: Draws a yellow line from (91, 93) to (365, 165).
; PLAN: r0=91(x1), r1=93(y1), r2=365(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 93
LDI r2, 365
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
