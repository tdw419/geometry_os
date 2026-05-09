; DESCRIPTION: Renders a white line between points (335, 34) and (391, 39).
; PLAN: r0=335(x1), r1=34(y1), r2=391(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 34
LDI r2, 391
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
