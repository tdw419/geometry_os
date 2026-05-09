; DESCRIPTION: Composite: Creates a black circular shape at (47, 171) with radius 45 then Renders a cyan box of size 75x29 starting at (75, 39).
; PLAN: r0=47(x), r1=171(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x), r6=39(y), r7=75(width), r8=29(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 47
LDI r1, 171
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 39
LDI r7, 75
LDI r8, 29
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
