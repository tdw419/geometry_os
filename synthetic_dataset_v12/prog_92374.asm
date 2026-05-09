; DESCRIPTION: Composite: Places a white dot at position (425, 255) then Creates a green circular shape at (275, 137) with radius 67 then Places a red 12x13 rectangle at position (450, 233).
; PLAN: r0=425(x), r1=255(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=275(x), r6=137(y), r7=67(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=450(x), r11=233(y), r12=12(width), r13=13(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 425
LDI r1, 255
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 275
LDI r6, 137
LDI r7, 67
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 450
LDI r11, 233
LDI r12, 12
LDI r13, 13
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
