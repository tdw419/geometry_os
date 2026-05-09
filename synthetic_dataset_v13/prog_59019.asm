; DESCRIPTION: Renders a black line between points (306, 114) and (401, 43).
; PLAN: r0=306(x1), r1=114(y1), r2=401(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 114
LDI r2, 401
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
