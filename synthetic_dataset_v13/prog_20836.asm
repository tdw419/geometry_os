; DESCRIPTION: Renders a magenta line between points (380, 21) and (165, 25).
; PLAN: r0=380(x1), r1=21(y1), r2=165(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 21
LDI r2, 165
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
