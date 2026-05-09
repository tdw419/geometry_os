; DESCRIPTION: Composite: Draws a cyan circle centered at (65, 92) with radius 27 then Renders a black box of size 112x119 starting at (66, 92).
; PLAN: r0=65(x), r1=92(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=66(x), r6=92(y), r7=112(width), r8=119(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 65
LDI r1, 92
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 66
LDI r6, 92
LDI r7, 112
LDI r8, 119
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
