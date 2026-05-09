; DESCRIPTION: Composite: Creates a green circular shape at (135, 146) with radius 80 then Draws a orange rectangle at (322, 135) with width 44 and height 32.
; PLAN: r0=135(x), r1=146(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x), r6=135(y), r7=44(width), r8=32(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 146
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 135
LDI r7, 44
LDI r8, 32
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
