; DESCRIPTION: Composite: Places a orange dot at position (259, 74) then Places a purple 79x28 rectangle at position (152, 156) then Renders a green disk with center (288, 89) and radius 39.
; PLAN: r0=259(x), r1=74(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=152(x), r6=156(y), r7=79(width), r8=28(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=288(x), r11=89(y), r12=39(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 259
LDI r1, 74
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 152
LDI r6, 156
LDI r7, 79
LDI r8, 28
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 288
LDI r11, 89
LDI r12, 39
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
