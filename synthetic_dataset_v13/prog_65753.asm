; DESCRIPTION: Composite: Places a red dot at position (324, 67) then Places a orange line segment connecting (488, 173) to (95, 159).
; PLAN: r0=324(x), r1=67(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=488(x1), r6=173(y1), r7=95(x2), r8=159(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 324
LDI r1, 67
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 488
LDI r6, 173
LDI r7, 95
LDI r8, 159
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
