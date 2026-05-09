; DESCRIPTION: Composite: Places a cyan circle of radius 64 at center (144, 69) then Draws a red rectangle at (108, 92) with width 39 and height 87.
; PLAN: r0=144(x), r1=69(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x), r6=92(y), r7=39(width), r8=87(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 144
LDI r1, 69
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 92
LDI r7, 39
LDI r8, 87
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
