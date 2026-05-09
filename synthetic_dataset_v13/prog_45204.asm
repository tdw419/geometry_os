; DESCRIPTION: Composite: Places a red circle of radius 63 at center (67, 96) then Places a red 22x112 rectangle at position (72, 92).
; PLAN: r0=67(x), r1=96(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=72(x), r6=92(y), r7=22(width), r8=112(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 96
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 72
LDI r6, 92
LDI r7, 22
LDI r8, 112
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
