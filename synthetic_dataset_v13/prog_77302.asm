; DESCRIPTION: Renders a magenta line between points (425, 115) and (35, 28).
; PLAN: r0=425(x1), r1=115(y1), r2=35(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 115
LDI r2, 35
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
