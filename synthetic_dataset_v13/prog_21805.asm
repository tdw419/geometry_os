; DESCRIPTION: Composite: Sets a single red pixel at (214, 183) then Renders a green box of size 114x45 starting at (94, 136) then Places a cyan circle of radius 76 at center (187, 160).
; PLAN: r0=214(x), r1=183(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=94(x), r6=136(y), r7=114(width), r8=45(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=187(x), r11=160(y), r12=76(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 214
LDI r1, 183
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 94
LDI r6, 136
LDI r7, 114
LDI r8, 45
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 160
LDI r12, 76
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
