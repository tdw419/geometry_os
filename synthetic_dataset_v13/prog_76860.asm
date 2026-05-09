; DESCRIPTION: Composite: Renders a orange box of size 47x71 starting at (199, 41) then Places a orange circle of radius 45 at center (395, 106).
; PLAN: r0=199(x), r1=41(y), r2=47(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=395(x), r6=106(y), r7=45(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 199
LDI r1, 41
LDI r2, 47
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 106
LDI r7, 45
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
