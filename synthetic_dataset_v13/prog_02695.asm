; DESCRIPTION: Composite: Draws a cyan rectangle at (327, 139) with width 28 and height 116 then Renders a cyan disk with center (117, 55) and radius 29.
; PLAN: r0=327(x), r1=139(y), r2=28(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x), r6=55(y), r7=29(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 327
LDI r1, 139
LDI r2, 28
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 55
LDI r7, 29
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
