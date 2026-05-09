; DESCRIPTION: Composite: Places a blue circle of radius 54 at center (353, 128) then Draws a magenta rectangle at (31, 28) with width 115 and height 64 then Places a green dot at position (50, 196).
; PLAN: r0=353(x), r1=128(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=31(x), r6=28(y), r7=115(width), r8=64(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=50(x), r11=196(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 353
LDI r1, 128
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 31
LDI r6, 28
LDI r7, 115
LDI r8, 64
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 50
LDI r11, 196
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
