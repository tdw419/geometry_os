; DESCRIPTION: Renders a white line between points (248, 180) and (154, 66).
; PLAN: r0=248(x1), r1=180(y1), r2=154(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 180
LDI r2, 154
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
