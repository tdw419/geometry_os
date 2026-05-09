; DESCRIPTION: Composite: Renders a red box of size 107x41 starting at (120, 161) then Places a orange circle of radius 74 at center (276, 84).
; PLAN: r0=120(x), r1=161(y), r2=107(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x), r6=84(y), r7=74(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 120
LDI r1, 161
LDI r2, 107
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 84
LDI r7, 74
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
