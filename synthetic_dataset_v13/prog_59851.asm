; DESCRIPTION: Composite: Draws a cyan rectangle at (284, 36) with width 80 and height 87 then Places a white circle of radius 67 at center (96, 166).
; PLAN: r0=284(x), r1=36(y), r2=80(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=96(x), r6=166(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 284
LDI r1, 36
LDI r2, 80
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 166
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
