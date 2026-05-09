; DESCRIPTION: Composite: Renders a magenta disk with center (335, 73) and radius 55 then Places a red 70x114 rectangle at position (109, 4) then Places a white dot at position (504, 144).
; PLAN: r0=335(x), r1=73(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x), r6=4(y), r7=70(width), r8=114(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=504(x), r11=144(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 335
LDI r1, 73
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 4
LDI r7, 70
LDI r8, 114
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 504
LDI r11, 144
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
