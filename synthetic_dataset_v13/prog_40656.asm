; DESCRIPTION: Composite: Places a white 11x16 rectangle at position (371, 169) then Places a purple circle of radius 68 at center (156, 129) then Places a magenta dot at position (346, 118).
; PLAN: r0=371(x), r1=169(y), r2=11(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x), r6=129(y), r7=68(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=346(x), r11=118(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 371
LDI r1, 169
LDI r2, 11
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 129
LDI r7, 68
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 346
LDI r11, 118
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
