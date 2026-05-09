; DESCRIPTION: Composite: Sets a single black pixel at (462, 224) then Renders a black disk with center (284, 172) and radius 30 then Places a black 21x94 rectangle at position (433, 103).
; PLAN: r0=462(x), r1=224(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=284(x), r6=172(y), r7=30(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=433(x), r11=103(y), r12=21(width), r13=94(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 462
LDI r1, 224
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 284
LDI r6, 172
LDI r7, 30
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 433
LDI r11, 103
LDI r12, 21
LDI r13, 94
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
