; DESCRIPTION: Composite: Draws a magenta rectangle at (108, 124) with width 70 and height 18 then Places a cyan circle of radius 73 at center (346, 88).
; PLAN: r0=108(x), r1=124(y), r2=70(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=346(x), r6=88(y), r7=73(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 108
LDI r1, 124
LDI r2, 70
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 88
LDI r7, 73
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
