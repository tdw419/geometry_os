; DESCRIPTION: Renders a white line between points (35, 19) and (384, 208).
; PLAN: r0=35(x1), r1=19(y1), r2=384(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 19
LDI r2, 384
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
