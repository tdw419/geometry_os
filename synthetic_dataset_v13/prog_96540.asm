; DESCRIPTION: Renders a white line between points (472, 39) and (197, 56).
; PLAN: r0=472(x1), r1=39(y1), r2=197(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 39
LDI r2, 197
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
