; DESCRIPTION: Composite: Renders a red disk with center (211, 56) and radius 28 then Renders a black box of size 97x27 starting at (251, 85) then Renders a magenta line between points (343, 126) and (167, 92).
; PLAN: r0=211(x), r1=56(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x), r6=85(y), r7=97(width), r8=27(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=343(x1), r11=126(y1), r12=167(x2), r13=92(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 211
LDI r1, 56
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 85
LDI r7, 97
LDI r8, 27
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 126
LDI r12, 167
LDI r13, 92
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
