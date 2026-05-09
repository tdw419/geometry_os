; DESCRIPTION: Renders a white line between points (198, 139) and (455, 43).
; PLAN: r0=198(x1), r1=139(y1), r2=455(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 139
LDI r2, 455
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
