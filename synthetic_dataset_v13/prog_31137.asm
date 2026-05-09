; DESCRIPTION: Renders a red line between points (268, 243) and (380, 9).
; PLAN: r0=268(x1), r1=243(y1), r2=380(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 243
LDI r2, 380
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
