; DESCRIPTION: Composite: Places a magenta dot at position (252, 96) then Draws a red rectangle at (320, 60) with width 111 and height 113 then Creates a white circular shape at (38, 187) with radius 12.
; PLAN: r0=252(x), r1=96(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=320(x), r6=60(y), r7=111(width), r8=113(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=38(x), r11=187(y), r12=12(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 252
LDI r1, 96
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 320
LDI r6, 60
LDI r7, 111
LDI r8, 113
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 38
LDI r11, 187
LDI r12, 12
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
