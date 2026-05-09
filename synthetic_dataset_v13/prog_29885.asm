; DESCRIPTION: Composite: Renders a green box of size 62x47 starting at (306, 190) then Creates a orange circular shape at (425, 123) with radius 50.
; PLAN: r0=306(x), r1=190(y), r2=62(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=425(x), r6=123(y), r7=50(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 306
LDI r1, 190
LDI r2, 62
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 123
LDI r7, 50
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
