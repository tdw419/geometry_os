; DESCRIPTION: Renders a white line between points (9, 42) and (289, 255).
; PLAN: r0=9(x1), r1=42(y1), r2=289(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 42
LDI r2, 289
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
