; DESCRIPTION: Composite: Places a red circle of radius 69 at center (312, 114) then Renders a blue box of size 27x105 starting at (208, 120) then Sets a single white pixel at (489, 88).
; PLAN: r0=312(x), r1=114(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=208(x), r6=120(y), r7=27(width), r8=105(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=489(x), r11=88(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 312
LDI r1, 114
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 208
LDI r6, 120
LDI r7, 27
LDI r8, 105
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 489
LDI r11, 88
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
