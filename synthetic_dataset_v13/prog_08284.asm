; DESCRIPTION: Composite: Places a black dot at position (2, 252) then Places a cyan 118x66 rectangle at position (262, 20) then Renders a orange disk with center (274, 61) and radius 32.
; PLAN: r0=2(x), r1=252(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=262(x), r6=20(y), r7=118(width), r8=66(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=274(x), r11=61(y), r12=32(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 2
LDI r1, 252
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 262
LDI r6, 20
LDI r7, 118
LDI r8, 66
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 61
LDI r12, 32
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
