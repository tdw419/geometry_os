; DESCRIPTION: Composite: Sets a single white pixel at (178, 0) then Renders a blue box of size 71x70 starting at (201, 179) then Places a magenta circle of radius 60 at center (451, 135).
; PLAN: r0=178(x), r1=0(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=201(x), r6=179(y), r7=71(width), r8=70(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=451(x), r11=135(y), r12=60(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 178
LDI r1, 0
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 201
LDI r6, 179
LDI r7, 71
LDI r8, 70
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 135
LDI r12, 60
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
