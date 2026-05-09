; DESCRIPTION: Composite: Draws a cyan circle centered at (205, 107) with radius 50 then Sets a single white pixel at (460, 213) then Renders a red box of size 45x110 starting at (67, 131).
; PLAN: r0=205(x), r1=107(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=460(x), r6=213(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=67(x), r11=131(y), r12=45(width), r13=110(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 107
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 460
LDI r6, 213
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 67
LDI r11, 131
LDI r12, 45
LDI r13, 110
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
