; DESCRIPTION: Renders a red line between points (289, 125) and (370, 27).
; PLAN: r0=289(x1), r1=125(y1), r2=370(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 125
LDI r2, 370
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
