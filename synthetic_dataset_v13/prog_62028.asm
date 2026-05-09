; DESCRIPTION: Composite: Draws a green circle centered at (326, 204) with radius 41 then Places a black dot at position (234, 203) then Renders a cyan box of size 48x56 starting at (25, 150).
; PLAN: r0=326(x), r1=204(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=234(x), r6=203(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=25(x), r11=150(y), r12=48(width), r13=56(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 326
LDI r1, 204
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 234
LDI r6, 203
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 25
LDI r11, 150
LDI r12, 48
LDI r13, 56
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
