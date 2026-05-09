; DESCRIPTION: Composite: Renders a green line between points (20, 252) and (67, 159) then Places a cyan dot at position (41, 20).
; PLAN: r0=20(x1), r1=252(y1), r2=67(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=41(x), r6=20(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 20
LDI r1, 252
LDI r2, 67
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 20
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
