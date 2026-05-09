; DESCRIPTION: Composite: Renders a orange disk with center (113, 162) and radius 12 then Renders a orange box of size 85x120 starting at (17, 122).
; PLAN: r0=113(x), r1=162(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=17(x), r6=122(y), r7=85(width), r8=120(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 162
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 17
LDI r6, 122
LDI r7, 85
LDI r8, 120
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
