; DESCRIPTION: Composite: Draws a cyan circle centered at (217, 175) with radius 70 then Renders a orange box of size 90x62 starting at (239, 9).
; PLAN: r0=217(x), r1=175(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=239(x), r6=9(y), r7=90(width), r8=62(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 175
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 239
LDI r6, 9
LDI r7, 90
LDI r8, 62
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
