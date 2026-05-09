; DESCRIPTION: Renders a white line between points (74, 168) and (122, 87).
; PLAN: r0=74(x1), r1=168(y1), r2=122(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 168
LDI r2, 122
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
