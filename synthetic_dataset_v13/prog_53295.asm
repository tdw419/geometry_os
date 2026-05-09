; DESCRIPTION: Composite: Places a magenta 106x111 rectangle at position (378, 113) then Renders a purple disk with center (420, 172) and radius 11 then Places a black dot at position (210, 234).
; PLAN: r0=378(x), r1=113(y), r2=106(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=420(x), r6=172(y), r7=11(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=210(x), r11=234(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 378
LDI r1, 113
LDI r2, 106
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 172
LDI r7, 11
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 210
LDI r11, 234
LDI r12, 0x000000
PSET r10, r11, r12
HALT
