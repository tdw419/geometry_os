; DESCRIPTION: Composite: Places a cyan circle of radius 61 at center (446, 88) then Places a orange 69x114 rectangle at position (284, 7) then Places a magenta dot at position (64, 104).
; PLAN: r0=446(x), r1=88(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x), r6=7(y), r7=69(width), r8=114(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=64(x), r11=104(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 446
LDI r1, 88
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 7
LDI r7, 69
LDI r8, 114
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 64
LDI r11, 104
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
