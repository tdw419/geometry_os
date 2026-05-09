; DESCRIPTION: Composite: Draws a red circle centered at (148, 99) with radius 68 then Places a red 67x115 rectangle at position (403, 121).
; PLAN: r0=148(x), r1=99(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=403(x), r6=121(y), r7=67(width), r8=115(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 148
LDI r1, 99
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 403
LDI r6, 121
LDI r7, 67
LDI r8, 115
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
