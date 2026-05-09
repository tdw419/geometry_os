; DESCRIPTION: Composite: Sets a single magenta pixel at (425, 48) then Renders a orange disk with center (49, 185) and radius 26 then Places a white 103x95 rectangle at position (116, 124).
; PLAN: r0=425(x), r1=48(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=49(x), r6=185(y), r7=26(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=116(x), r11=124(y), r12=103(width), r13=95(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 425
LDI r1, 48
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 49
LDI r6, 185
LDI r7, 26
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 116
LDI r11, 124
LDI r12, 103
LDI r13, 95
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
