; DESCRIPTION: Composite: Draws a yellow rectangle at (267, 35) with width 48 and height 110 then Draws a cyan circle centered at (187, 146) with radius 46.
; PLAN: r0=267(x), r1=35(y), r2=48(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=187(x), r6=146(y), r7=46(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 267
LDI r1, 35
LDI r2, 48
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 146
LDI r7, 46
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
