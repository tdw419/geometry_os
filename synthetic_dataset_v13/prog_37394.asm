; DESCRIPTION: Composite: Places a green dot at position (338, 206) then Places a cyan circle of radius 80 at center (314, 139) then Draws a white rectangle at (60, 161) with width 94 and height 92.
; PLAN: r0=338(x), r1=206(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=314(x), r6=139(y), r7=80(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=60(x), r11=161(y), r12=94(width), r13=92(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 338
LDI r1, 206
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 314
LDI r6, 139
LDI r7, 80
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 60
LDI r11, 161
LDI r12, 94
LDI r13, 92
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
