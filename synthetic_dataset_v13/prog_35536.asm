; DESCRIPTION: Composite: Renders a red line between points (207, 9) and (458, 227) then Places a red 98x111 rectangle at position (306, 45).
; PLAN: r0=207(x1), r1=9(y1), r2=458(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=306(x), r6=45(y), r7=98(width), r8=111(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 207
LDI r1, 9
LDI r2, 458
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 45
LDI r7, 98
LDI r8, 111
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
