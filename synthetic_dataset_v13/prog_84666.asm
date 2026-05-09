; DESCRIPTION: Renders a white line between points (383, 111) and (252, 170).
; PLAN: r0=383(x1), r1=111(y1), r2=252(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 111
LDI r2, 252
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
