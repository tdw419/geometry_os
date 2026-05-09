; DESCRIPTION: Composite: Creates a cyan circular shape at (108, 75) with radius 75 then Places a green dot at position (48, 228) then Draws a cyan rectangle at (408, 70) with width 90 and height 116.
; PLAN: r0=108(x), r1=75(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=228(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=408(x), r11=70(y), r12=90(width), r13=116(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 75
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 228
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 408
LDI r11, 70
LDI r12, 90
LDI r13, 116
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
