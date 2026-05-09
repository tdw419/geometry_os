; DESCRIPTION: Renders a white line between points (12, 111) and (344, 140).
; PLAN: r0=12(x1), r1=111(y1), r2=344(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 111
LDI r2, 344
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
