; DESCRIPTION: Renders a white line between points (49, 165) and (450, 126).
; PLAN: r0=49(x1), r1=165(y1), r2=450(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 165
LDI r2, 450
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
