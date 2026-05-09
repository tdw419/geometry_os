; DESCRIPTION: Renders a white line between points (372, 184) and (380, 187).
; PLAN: r0=372(x1), r1=184(y1), r2=380(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 184
LDI r2, 380
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
