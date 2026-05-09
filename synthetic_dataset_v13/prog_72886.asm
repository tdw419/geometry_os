; DESCRIPTION: Renders a white line between points (373, 73) and (268, 65).
; PLAN: r0=373(x1), r1=73(y1), r2=268(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 73
LDI r2, 268
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
