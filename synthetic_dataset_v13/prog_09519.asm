; DESCRIPTION: Composite: Places a green 29x70 rectangle at position (132, 95) then Draws a cyan circle centered at (119, 175) with radius 58.
; PLAN: r0=132(x), r1=95(y), r2=29(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=119(x), r6=175(y), r7=58(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 132
LDI r1, 95
LDI r2, 29
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 175
LDI r7, 58
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
