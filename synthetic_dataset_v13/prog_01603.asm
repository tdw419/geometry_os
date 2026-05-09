; DESCRIPTION: Composite: Sets a single yellow pixel at (194, 223) then Renders a blue box of size 42x26 starting at (89, 150) then Places a cyan circle of radius 23 at center (278, 138).
; PLAN: r0=194(x), r1=223(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=89(x), r6=150(y), r7=42(width), r8=26(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=278(x), r11=138(y), r12=23(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 194
LDI r1, 223
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 89
LDI r6, 150
LDI r7, 42
LDI r8, 26
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 278
LDI r11, 138
LDI r12, 23
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
