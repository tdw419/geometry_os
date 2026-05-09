; DESCRIPTION: Renders a white line between points (256, 0) and (355, 246).
; PLAN: r0=256(x1), r1=0(y1), r2=355(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 0
LDI r2, 355
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
