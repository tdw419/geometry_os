; DESCRIPTION: Renders a cyan line between points (420, 232) and (41, 7).
; PLAN: r0=420(x1), r1=232(y1), r2=41(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 232
LDI r2, 41
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
