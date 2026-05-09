; DESCRIPTION: Composite: Draws a red circle centered at (143, 196) with radius 55 then Draws a cyan rectangle at (255, 177) with width 94 and height 12.
; PLAN: r0=143(x), r1=196(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=255(x), r6=177(y), r7=94(width), r8=12(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 196
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 255
LDI r6, 177
LDI r7, 94
LDI r8, 12
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
