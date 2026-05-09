; DESCRIPTION: Composite: Renders a orange box of size 67x64 starting at (377, 28) then Draws a red circle centered at (174, 65) with radius 21.
; PLAN: r0=377(x), r1=28(y), r2=67(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x), r6=65(y), r7=21(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 377
LDI r1, 28
LDI r2, 67
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 65
LDI r7, 21
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
