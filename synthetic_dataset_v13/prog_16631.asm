; DESCRIPTION: Composite: Renders a magenta box of size 39x14 starting at (5, 116) then Places a magenta dot at position (39, 154) then Draws a magenta circle centered at (312, 74) with radius 60.
; PLAN: r0=5(x), r1=116(y), r2=39(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=39(x), r6=154(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=312(x), r11=74(y), r12=60(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 5
LDI r1, 116
LDI r2, 39
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 154
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 312
LDI r11, 74
LDI r12, 60
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
