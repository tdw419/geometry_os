; DESCRIPTION: Composite: Renders a magenta box of size 73x109 starting at (437, 20) then Places a white circle of radius 55 at center (191, 103) then Places a green dot at position (62, 104).
; PLAN: r0=437(x), r1=20(y), r2=73(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x), r6=103(y), r7=55(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=62(x), r11=104(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 437
LDI r1, 20
LDI r2, 73
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 103
LDI r7, 55
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 62
LDI r11, 104
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
