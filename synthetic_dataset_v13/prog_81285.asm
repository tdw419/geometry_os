; DESCRIPTION: Renders a white line between points (42, 174) and (230, 157).
; PLAN: r0=42(x1), r1=174(y1), r2=230(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 174
LDI r2, 230
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
