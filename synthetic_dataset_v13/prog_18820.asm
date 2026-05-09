; DESCRIPTION: Renders a cyan line between points (41, 206) and (425, 12).
; PLAN: r0=41(x1), r1=206(y1), r2=425(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 206
LDI r2, 425
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
