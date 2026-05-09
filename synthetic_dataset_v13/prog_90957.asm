; DESCRIPTION: Composite: Places a white dot at position (202, 85) then Places a red 72x21 rectangle at position (373, 19) then Places a red circle of radius 79 at center (310, 83).
; PLAN: r0=202(x), r1=85(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=373(x), r6=19(y), r7=72(width), r8=21(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=310(x), r11=83(y), r12=79(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 202
LDI r1, 85
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 373
LDI r6, 19
LDI r7, 72
LDI r8, 21
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 83
LDI r12, 79
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
