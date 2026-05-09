; DESCRIPTION: Composite: Draws a red circle centered at (312, 164) with radius 69 then Places a cyan dot at position (289, 13) then Renders a red box of size 104x30 starting at (125, 130).
; PLAN: r0=312(x), r1=164(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=289(x), r6=13(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=125(x), r11=130(y), r12=104(width), r13=30(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 312
LDI r1, 164
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 289
LDI r6, 13
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 125
LDI r11, 130
LDI r12, 104
LDI r13, 30
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
