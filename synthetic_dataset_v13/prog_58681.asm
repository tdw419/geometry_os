; DESCRIPTION: Composite: Draws a green circle centered at (296, 74) with radius 15 then Sets a single red pixel at (281, 48) then Renders a red box of size 93x28 starting at (111, 221).
; PLAN: r0=296(x), r1=74(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=281(x), r6=48(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=111(x), r11=221(y), r12=93(width), r13=28(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 296
LDI r1, 74
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 281
LDI r6, 48
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 111
LDI r11, 221
LDI r12, 93
LDI r13, 28
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
