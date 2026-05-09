; DESCRIPTION: Composite: Creates a cyan circular shape at (115, 152) with radius 52 then Draws a black rectangle at (167, 41) with width 18 and height 69.
; PLAN: r0=115(x), r1=152(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=167(x), r6=41(y), r7=18(width), r8=69(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 115
LDI r1, 152
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 167
LDI r6, 41
LDI r7, 18
LDI r8, 69
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
