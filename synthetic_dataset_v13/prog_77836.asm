; DESCRIPTION: Composite: Places a yellow dot at position (368, 170) then Renders a yellow box of size 45x56 starting at (376, 109) then Places a yellow circle of radius 30 at center (214, 173).
; PLAN: r0=368(x), r1=170(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=376(x), r6=109(y), r7=45(width), r8=56(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=214(x), r11=173(y), r12=30(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 368
LDI r1, 170
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 376
LDI r6, 109
LDI r7, 45
LDI r8, 56
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 214
LDI r11, 173
LDI r12, 30
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
