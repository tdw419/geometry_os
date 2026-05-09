; DESCRIPTION: Composite: Places a yellow dot at position (91, 109) then Places a white circle of radius 47 at center (450, 151) then Draws a magenta rectangle at (197, 54) with width 24 and height 48.
; PLAN: r0=91(x), r1=109(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=450(x), r6=151(y), r7=47(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=197(x), r11=54(y), r12=24(width), r13=48(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 109
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 450
LDI r6, 151
LDI r7, 47
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 197
LDI r11, 54
LDI r12, 24
LDI r13, 48
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
