; DESCRIPTION: Composite: Creates a white circular shape at (79, 74) with radius 45 then Sets a single black pixel at (186, 117) then Renders a red box of size 64x111 starting at (266, 91).
; PLAN: r0=79(x), r1=74(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=186(x), r6=117(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=266(x), r11=91(y), r12=64(width), r13=111(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 79
LDI r1, 74
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 186
LDI r6, 117
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 266
LDI r11, 91
LDI r12, 64
LDI r13, 111
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
