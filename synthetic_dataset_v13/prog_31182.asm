; DESCRIPTION: Composite: Draws a white rectangle at (118, 7) with width 25 and height 16 then Creates a red circular shape at (187, 118) with radius 63.
; PLAN: r0=118(x), r1=7(y), r2=25(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=187(x), r6=118(y), r7=63(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 118
LDI r1, 7
LDI r2, 25
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 118
LDI r7, 63
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
