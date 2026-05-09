; DESCRIPTION: Composite: Places a red dot at position (66, 64) then Creates a cyan rectangular region at (402, 24) spanning 71 by 16 pixels then Places a blue circle of radius 68 at center (122, 90).
; PLAN: r0=66(x), r1=64(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=402(x), r6=24(y), r7=71(width), r8=16(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=122(x), r11=90(y), r12=68(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 66
LDI r1, 64
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 402
LDI r6, 24
LDI r7, 71
LDI r8, 16
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 90
LDI r12, 68
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
