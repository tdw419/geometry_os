; DESCRIPTION: Composite: Places a cyan circle of radius 34 at center (432, 191) then Draws a purple rectangle at (113, 116) with width 59 and height 68.
; PLAN: r0=432(x), r1=191(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=113(x), r6=116(y), r7=59(width), r8=68(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 432
LDI r1, 191
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 113
LDI r6, 116
LDI r7, 59
LDI r8, 68
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
