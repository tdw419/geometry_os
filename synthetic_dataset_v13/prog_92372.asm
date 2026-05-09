; DESCRIPTION: Renders a white line between points (509, 42) and (62, 47).
; PLAN: r0=509(x1), r1=42(y1), r2=62(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 42
LDI r2, 62
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
