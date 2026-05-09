; DESCRIPTION: Composite: Creates a red rectangular region at (243, 166) spanning 87 by 65 pixels then Places a red circle of radius 26 at center (240, 123).
; PLAN: r0=243(x), r1=166(y), r2=87(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x), r6=123(y), r7=26(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 243
LDI r1, 166
LDI r2, 87
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 123
LDI r7, 26
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
