; DESCRIPTION: Renders a yellow line between points (268, 55) and (394, 240).
; PLAN: r0=268(x1), r1=55(y1), r2=394(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 55
LDI r2, 394
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
