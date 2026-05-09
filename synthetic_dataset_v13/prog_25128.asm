; DESCRIPTION: Renders a cyan line between points (135, 41) and (264, 122).
; PLAN: r0=135(x1), r1=41(y1), r2=264(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 41
LDI r2, 264
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
