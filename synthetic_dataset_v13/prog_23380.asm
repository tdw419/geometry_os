; DESCRIPTION: Composite: Places a orange dot at position (246, 241) then Creates a cyan circular shape at (448, 154) with radius 61 then Places a blue 24x64 rectangle at position (448, 178).
; PLAN: r0=246(x), r1=241(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=448(x), r6=154(y), r7=61(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=448(x), r11=178(y), r12=24(width), r13=64(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 241
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 448
LDI r6, 154
LDI r7, 61
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 448
LDI r11, 178
LDI r12, 24
LDI r13, 64
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
