; DESCRIPTION: Composite: Places a black dot at position (504, 116) then Draws a black rectangle at (67, 108) with width 61 and height 118 then Places a cyan line segment connecting (454, 158) to (397, 47).
; PLAN: r0=504(x), r1=116(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=108(y), r7=61(width), r8=118(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=454(x1), r11=158(y1), r12=397(x2), r13=47(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 504
LDI r1, 116
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 67
LDI r6, 108
LDI r7, 61
LDI r8, 118
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 454
LDI r11, 158
LDI r12, 397
LDI r13, 47
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
