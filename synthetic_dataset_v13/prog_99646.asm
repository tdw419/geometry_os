; DESCRIPTION: Composite: Creates a cyan rectangular region at (75, 38) spanning 94 by 119 pixels then Places a blue dot at position (32, 75) then Renders a blue disk with center (356, 53) and radius 47.
; PLAN: r0=75(x), r1=38(y), r2=94(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=32(x), r6=75(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=356(x), r11=53(y), r12=47(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 75
LDI r1, 38
LDI r2, 94
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 75
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 356
LDI r11, 53
LDI r12, 47
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
