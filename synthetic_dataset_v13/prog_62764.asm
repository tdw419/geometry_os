; DESCRIPTION: Composite: Creates a orange circular shape at (442, 200) with radius 34 then Renders a red line between points (497, 202) and (445, 193).
; PLAN: r0=442(x), r1=200(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=497(x1), r6=202(y1), r7=445(x2), r8=193(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 442
LDI r1, 200
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 497
LDI r6, 202
LDI r7, 445
LDI r8, 193
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
