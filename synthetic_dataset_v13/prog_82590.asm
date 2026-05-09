; DESCRIPTION: Composite: Sets a single black pixel at (450, 240) then Places a black circle of radius 74 at center (303, 117) then Renders a yellow box of size 42x54 starting at (87, 112).
; PLAN: r0=450(x), r1=240(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=303(x), r6=117(y), r7=74(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=87(x), r11=112(y), r12=42(width), r13=54(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 450
LDI r1, 240
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 303
LDI r6, 117
LDI r7, 74
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 87
LDI r11, 112
LDI r12, 42
LDI r13, 54
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
