; DESCRIPTION: Renders a white line between points (294, 61) and (127, 245).
; PLAN: r0=294(x1), r1=61(y1), r2=127(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 61
LDI r2, 127
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
