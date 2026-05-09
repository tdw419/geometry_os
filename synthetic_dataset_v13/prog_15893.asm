; DESCRIPTION: Renders a yellow line between points (121, 126) and (380, 251).
; PLAN: r0=121(x1), r1=126(y1), r2=380(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 126
LDI r2, 380
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
