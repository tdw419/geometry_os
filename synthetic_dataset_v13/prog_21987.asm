; DESCRIPTION: Composite: Sets a single red pixel at (230, 59) then Creates a red circular shape at (307, 160) with radius 69 then Renders a green box of size 119x70 starting at (216, 106).
; PLAN: r0=230(x), r1=59(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=307(x), r6=160(y), r7=69(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=216(x), r11=106(y), r12=119(width), r13=70(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 59
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 307
LDI r6, 160
LDI r7, 69
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 216
LDI r11, 106
LDI r12, 119
LDI r13, 70
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
