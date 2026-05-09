; DESCRIPTION: Renders a white line between points (375, 166) and (424, 167).
; PLAN: r0=375(x1), r1=166(y1), r2=424(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 166
LDI r2, 424
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
