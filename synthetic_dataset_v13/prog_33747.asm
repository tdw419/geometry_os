; DESCRIPTION: Composite: Draws a white circle centered at (130, 166) with radius 64 then Renders a white box of size 90x104 starting at (377, 59).
; PLAN: r0=130(x), r1=166(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x), r6=59(y), r7=90(width), r8=104(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 166
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 59
LDI r7, 90
LDI r8, 104
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
