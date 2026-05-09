; DESCRIPTION: Composite: Renders a red box of size 19x69 starting at (8, 151) then Places a magenta dot at position (405, 57) then Places a magenta circle of radius 26 at center (170, 224).
; PLAN: r0=8(x), r1=151(y), r2=19(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x), r6=57(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=170(x), r11=224(y), r12=26(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 8
LDI r1, 151
LDI r2, 19
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 57
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 170
LDI r11, 224
LDI r12, 26
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
