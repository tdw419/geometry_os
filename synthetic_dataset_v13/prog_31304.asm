; DESCRIPTION: Composite: Places a orange line segment connecting (226, 168) to (443, 183) then Places a red circle of radius 62 at center (442, 65).
; PLAN: r0=226(x1), r1=168(y1), r2=443(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=65(y), r7=62(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 226
LDI r1, 168
LDI r2, 443
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 65
LDI r7, 62
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
