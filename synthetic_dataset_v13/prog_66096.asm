; DESCRIPTION: Renders a black line between points (268, 37) and (156, 29).
; PLAN: r0=268(x1), r1=37(y1), r2=156(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 37
LDI r2, 156
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
