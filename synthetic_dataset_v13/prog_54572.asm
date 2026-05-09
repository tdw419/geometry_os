; DESCRIPTION: Renders a black line between points (310, 67) and (74, 177).
; PLAN: r0=310(x1), r1=67(y1), r2=74(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 67
LDI r2, 74
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
