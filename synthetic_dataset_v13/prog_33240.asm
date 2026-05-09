; DESCRIPTION: Composite: Sets a single orange pixel at (77, 188) then Renders a red box of size 11x92 starting at (443, 5) then Renders a blue disk with center (311, 61) and radius 34.
; PLAN: r0=77(x), r1=188(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=443(x), r6=5(y), r7=11(width), r8=92(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=311(x), r11=61(y), r12=34(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 77
LDI r1, 188
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 443
LDI r6, 5
LDI r7, 11
LDI r8, 92
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 61
LDI r12, 34
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
