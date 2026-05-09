; DESCRIPTION: Composite: Places a red dot at position (40, 125) then Renders a red line between points (72, 42) and (482, 34).
; PLAN: r0=40(x), r1=125(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=72(x1), r6=42(y1), r7=482(x2), r8=34(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 40
LDI r1, 125
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 72
LDI r6, 42
LDI r7, 482
LDI r8, 34
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
