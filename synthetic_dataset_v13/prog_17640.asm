; DESCRIPTION: Composite: Places a red circle of radius 23 at center (96, 93) then Renders a red line between points (130, 67) and (183, 121).
; PLAN: r0=96(x), r1=93(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=130(x1), r6=67(y1), r7=183(x2), r8=121(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 96
LDI r1, 93
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 130
LDI r6, 67
LDI r7, 183
LDI r8, 121
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
