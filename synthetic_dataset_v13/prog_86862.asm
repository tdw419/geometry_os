; DESCRIPTION: Composite: Sets a single magenta pixel at (493, 205) then Renders a purple box of size 88x94 starting at (71, 33) then Renders a yellow disk with center (286, 182) and radius 31.
; PLAN: r0=493(x), r1=205(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=71(x), r6=33(y), r7=88(width), r8=94(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=286(x), r11=182(y), r12=31(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 493
LDI r1, 205
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 71
LDI r6, 33
LDI r7, 88
LDI r8, 94
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 286
LDI r11, 182
LDI r12, 31
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
