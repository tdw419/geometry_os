; DESCRIPTION: Composite: Places a blue dot at position (499, 209) then Renders a white disk with center (374, 107) and radius 44 then Renders a blue box of size 78x113 starting at (45, 90).
; PLAN: r0=499(x), r1=209(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=374(x), r6=107(y), r7=44(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=45(x), r11=90(y), r12=78(width), r13=113(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 499
LDI r1, 209
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 374
LDI r6, 107
LDI r7, 44
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 45
LDI r11, 90
LDI r12, 78
LDI r13, 113
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
