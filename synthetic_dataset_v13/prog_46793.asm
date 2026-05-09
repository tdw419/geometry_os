; DESCRIPTION: Composite: Renders a red disk with center (360, 129) and radius 61 then Draws a cyan rectangle at (50, 115) with width 39 and height 88.
; PLAN: r0=360(x), r1=129(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=50(x), r6=115(y), r7=39(width), r8=88(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 129
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 50
LDI r6, 115
LDI r7, 39
LDI r8, 88
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
