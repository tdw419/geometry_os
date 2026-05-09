; DESCRIPTION: Composite: Renders a yellow disk with center (380, 163) and radius 66 then Draws a red rectangle at (115, 119) with width 102 and height 16.
; PLAN: r0=380(x), r1=163(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x), r6=119(y), r7=102(width), r8=16(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 380
LDI r1, 163
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 119
LDI r7, 102
LDI r8, 16
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
