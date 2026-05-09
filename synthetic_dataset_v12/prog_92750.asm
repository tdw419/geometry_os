; DESCRIPTION: Composite: Draws a green circle centered at (274, 146) with radius 80 then Renders a red box of size 31x106 starting at (180, 41).
; PLAN: r0=274(x), r1=146(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=180(x), r6=41(y), r7=31(width), r8=106(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 146
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 180
LDI r6, 41
LDI r7, 31
LDI r8, 106
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
