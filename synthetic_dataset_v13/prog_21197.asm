; DESCRIPTION: Renders a white line between points (287, 213) and (378, 168).
; PLAN: r0=287(x1), r1=213(y1), r2=378(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 213
LDI r2, 378
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
