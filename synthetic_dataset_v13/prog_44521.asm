; DESCRIPTION: Composite: Places a orange circle of radius 10 at center (43, 190) then Renders a blue box of size 12x69 starting at (143, 175).
; PLAN: r0=43(x), r1=190(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=143(x), r6=175(y), r7=12(width), r8=69(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 43
LDI r1, 190
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 143
LDI r6, 175
LDI r7, 12
LDI r8, 69
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
