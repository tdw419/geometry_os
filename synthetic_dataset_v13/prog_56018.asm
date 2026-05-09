; DESCRIPTION: Composite: Creates a purple rectangular region at (284, 58) spanning 41 by 120 pixels then Draws a yellow circle centered at (143, 207) with radius 38.
; PLAN: r0=284(x), r1=58(y), r2=41(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x), r6=207(y), r7=38(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 284
LDI r1, 58
LDI r2, 41
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 207
LDI r7, 38
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
