; DESCRIPTION: Renders a cyan line between points (166, 140) and (41, 69).
; PLAN: r0=166(x1), r1=140(y1), r2=41(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 140
LDI r2, 41
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
