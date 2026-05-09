; DESCRIPTION: Composite: Sets a single blue pixel at (223, 138) then Renders a cyan disk with center (398, 182) and radius 68 then Renders a orange box of size 19x72 starting at (100, 153).
; PLAN: r0=223(x), r1=138(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=398(x), r6=182(y), r7=68(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=100(x), r11=153(y), r12=19(width), r13=72(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 223
LDI r1, 138
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 398
LDI r6, 182
LDI r7, 68
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 100
LDI r11, 153
LDI r12, 19
LDI r13, 72
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
