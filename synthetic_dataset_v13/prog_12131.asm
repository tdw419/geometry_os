; DESCRIPTION: Composite: Draws a red rectangle at (354, 98) with width 55 and height 41 then Places a green circle of radius 70 at center (410, 129).
; PLAN: r0=354(x), r1=98(y), r2=55(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=410(x), r6=129(y), r7=70(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 354
LDI r1, 98
LDI r2, 55
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 129
LDI r7, 70
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
