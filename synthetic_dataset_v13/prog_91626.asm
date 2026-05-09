; DESCRIPTION: Composite: Creates a black circular shape at (405, 131) with radius 68 then Draws a green rectangle at (416, 87) with width 34 and height 22 then Sets a single magenta pixel at (507, 208).
; PLAN: r0=405(x), r1=131(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=416(x), r6=87(y), r7=34(width), r8=22(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=507(x), r11=208(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 405
LDI r1, 131
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 416
LDI r6, 87
LDI r7, 34
LDI r8, 22
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 507
LDI r11, 208
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
