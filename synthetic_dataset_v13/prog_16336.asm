; DESCRIPTION: Composite: Places a black circle of radius 38 at center (152, 42) then Draws a red rectangle at (392, 185) with width 39 and height 43.
; PLAN: r0=152(x), r1=42(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=392(x), r6=185(y), r7=39(width), r8=43(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 152
LDI r1, 42
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 392
LDI r6, 185
LDI r7, 39
LDI r8, 43
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
