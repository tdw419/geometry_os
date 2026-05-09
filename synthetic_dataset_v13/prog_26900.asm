; DESCRIPTION: Renders a white line between points (383, 215) and (194, 98).
; PLAN: r0=383(x1), r1=215(y1), r2=194(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 215
LDI r2, 194
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
