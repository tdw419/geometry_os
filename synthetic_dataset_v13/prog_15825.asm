; DESCRIPTION: Composite: Creates a yellow circular shape at (223, 134) with radius 50 then Renders a orange box of size 76x61 starting at (66, 48) then Sets a single purple pixel at (266, 166).
; PLAN: r0=223(x), r1=134(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=66(x), r6=48(y), r7=76(width), r8=61(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=266(x), r11=166(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 223
LDI r1, 134
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 66
LDI r6, 48
LDI r7, 76
LDI r8, 61
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 266
LDI r11, 166
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
