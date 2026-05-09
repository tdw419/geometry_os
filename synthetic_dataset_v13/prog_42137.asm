; DESCRIPTION: Renders a white line between points (446, 154) and (355, 205).
; PLAN: r0=446(x1), r1=154(y1), r2=355(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 154
LDI r2, 355
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
