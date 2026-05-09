; DESCRIPTION: Composite: Draws a magenta circle centered at (45, 144) with radius 19 then Places a cyan dot at position (284, 36) then Renders a magenta box of size 101x92 starting at (133, 23).
; PLAN: r0=45(x), r1=144(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x), r6=36(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=133(x), r11=23(y), r12=101(width), r13=92(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 45
LDI r1, 144
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 36
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 133
LDI r11, 23
LDI r12, 101
LDI r13, 92
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
