; DESCRIPTION: Composite: Sets a single blue pixel at (450, 29) then Renders a red disk with center (367, 72) and radius 70 then Places a white 16x18 rectangle at position (140, 66).
; PLAN: r0=450(x), r1=29(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=367(x), r6=72(y), r7=70(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=140(x), r11=66(y), r12=16(width), r13=18(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 450
LDI r1, 29
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 367
LDI r6, 72
LDI r7, 70
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 140
LDI r11, 66
LDI r12, 16
LDI r13, 18
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
