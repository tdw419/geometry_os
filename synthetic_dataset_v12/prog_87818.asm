; DESCRIPTION: Renders a white line between points (176, 166) and (411, 184).
; PLAN: r0=176(x1), r1=166(y1), r2=411(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 166
LDI r2, 411
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
