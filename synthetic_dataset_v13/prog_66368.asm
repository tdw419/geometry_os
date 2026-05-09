; DESCRIPTION: Composite: Places a white dot at position (465, 196) then Renders a yellow box of size 32x58 starting at (480, 41) then Renders a cyan disk with center (274, 165) and radius 73.
; PLAN: r0=465(x), r1=196(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=480(x), r6=41(y), r7=32(width), r8=58(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=274(x), r11=165(y), r12=73(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 465
LDI r1, 196
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 480
LDI r6, 41
LDI r7, 32
LDI r8, 58
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 165
LDI r12, 73
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
