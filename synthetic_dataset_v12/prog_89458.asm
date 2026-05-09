; DESCRIPTION: Composite: Places a orange circle of radius 42 at center (438, 90) then Renders a red box of size 70x11 starting at (2, 141).
; PLAN: r0=438(x), r1=90(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=2(x), r6=141(y), r7=70(width), r8=11(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 438
LDI r1, 90
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 2
LDI r6, 141
LDI r7, 70
LDI r8, 11
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
