; DESCRIPTION: Composite: Places a red circle of radius 33 at center (284, 189) then Draws a black rectangle at (389, 93) with width 61 and height 109.
; PLAN: r0=284(x), r1=189(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=389(x), r6=93(y), r7=61(width), r8=109(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 284
LDI r1, 189
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 389
LDI r6, 93
LDI r7, 61
LDI r8, 109
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
