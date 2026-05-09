; DESCRIPTION: Composite: Sets a single black pixel at (336, 182) then Draws a blue rectangle at (317, 38) with width 111 and height 107 then Creates a red circular shape at (414, 196) with radius 53.
; PLAN: r0=336(x), r1=182(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=317(x), r6=38(y), r7=111(width), r8=107(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=414(x), r11=196(y), r12=53(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 336
LDI r1, 182
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 317
LDI r6, 38
LDI r7, 111
LDI r8, 107
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 196
LDI r12, 53
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
