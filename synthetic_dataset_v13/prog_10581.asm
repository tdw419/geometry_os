; DESCRIPTION: Renders a magenta line between points (380, 115) and (324, 83).
; PLAN: r0=380(x1), r1=115(y1), r2=324(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 115
LDI r2, 324
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
