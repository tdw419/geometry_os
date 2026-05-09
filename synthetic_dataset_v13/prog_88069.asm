; DESCRIPTION: Composite: Draws a red circle centered at (410, 119) with radius 41 then Draws a green rectangle at (286, 89) with width 86 and height 39.
; PLAN: r0=410(x), r1=119(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=286(x), r6=89(y), r7=86(width), r8=39(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 410
LDI r1, 119
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 286
LDI r6, 89
LDI r7, 86
LDI r8, 39
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
