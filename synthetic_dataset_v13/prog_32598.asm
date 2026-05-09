; DESCRIPTION: Composite: Draws a cyan circle centered at (190, 92) with radius 28 then Sets a single yellow pixel at (361, 20) then Renders a white box of size 109x82 starting at (231, 134).
; PLAN: r0=190(x), r1=92(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=361(x), r6=20(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=231(x), r11=134(y), r12=109(width), r13=82(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 92
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 361
LDI r6, 20
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 231
LDI r11, 134
LDI r12, 109
LDI r13, 82
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
