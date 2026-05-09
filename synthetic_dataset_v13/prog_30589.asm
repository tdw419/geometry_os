; DESCRIPTION: Composite: Draws a orange rectangle at (27, 92) with width 60 and height 103 then Creates a cyan circular shape at (221, 154) with radius 41.
; PLAN: r0=27(x), r1=92(y), r2=60(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=221(x), r6=154(y), r7=41(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 27
LDI r1, 92
LDI r2, 60
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 154
LDI r7, 41
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
