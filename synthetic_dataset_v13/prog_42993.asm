; DESCRIPTION: Renders a white line between points (380, 163) and (0, 76).
; PLAN: r0=380(x1), r1=163(y1), r2=0(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 163
LDI r2, 0
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
