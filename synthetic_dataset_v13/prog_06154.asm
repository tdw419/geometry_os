; DESCRIPTION: Draws a black line from (210, 93) to (273, 156).
; PLAN: r0=210(x1), r1=93(y1), r2=273(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 93
LDI r2, 273
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
