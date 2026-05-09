; DESCRIPTION: Composite: Places a magenta dot at position (477, 21) then Renders a purple disk with center (47, 90) and radius 11 then Renders a white box of size 119x44 starting at (39, 29).
; PLAN: r0=477(x), r1=21(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=47(x), r6=90(y), r7=11(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=39(x), r11=29(y), r12=119(width), r13=44(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 477
LDI r1, 21
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 47
LDI r6, 90
LDI r7, 11
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 39
LDI r11, 29
LDI r12, 119
LDI r13, 44
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
