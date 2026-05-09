; DESCRIPTION: Composite: Places a black dot at position (358, 40) then Draws a black circle centered at (389, 146) with radius 50 then Renders a green box of size 82x112 starting at (20, 17).
; PLAN: r0=358(x), r1=40(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=389(x), r6=146(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=20(x), r11=17(y), r12=82(width), r13=112(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 358
LDI r1, 40
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 389
LDI r6, 146
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 20
LDI r11, 17
LDI r12, 82
LDI r13, 112
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
