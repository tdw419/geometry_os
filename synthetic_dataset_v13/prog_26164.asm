; DESCRIPTION: Composite: Places a red dot at position (402, 217) then Places a magenta 12x80 rectangle at position (35, 65) then Places a cyan circle of radius 68 at center (223, 101).
; PLAN: r0=402(x), r1=217(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=35(x), r6=65(y), r7=12(width), r8=80(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=223(x), r11=101(y), r12=68(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 402
LDI r1, 217
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 35
LDI r6, 65
LDI r7, 12
LDI r8, 80
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 223
LDI r11, 101
LDI r12, 68
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
