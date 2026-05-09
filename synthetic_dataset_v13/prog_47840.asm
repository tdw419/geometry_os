; DESCRIPTION: Composite: Draws a red rectangle at (229, 177) with width 114 and height 70 then Draws a cyan circle centered at (36, 91) with radius 16.
; PLAN: r0=229(x), r1=177(y), r2=114(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=36(x), r6=91(y), r7=16(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 229
LDI r1, 177
LDI r2, 114
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 91
LDI r7, 16
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
