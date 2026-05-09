; DESCRIPTION: Composite: Draws a orange rectangle at (48, 61) with width 99 and height 103 then Draws a white circle centered at (247, 85) with radius 79.
; PLAN: r0=48(x), r1=61(y), r2=99(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=247(x), r6=85(y), r7=79(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 48
LDI r1, 61
LDI r2, 99
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 85
LDI r7, 79
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
