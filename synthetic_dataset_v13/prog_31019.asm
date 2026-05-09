; DESCRIPTION: Renders a white line between points (113, 126) and (120, 85).
; PLAN: r0=113(x1), r1=126(y1), r2=120(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 126
LDI r2, 120
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
