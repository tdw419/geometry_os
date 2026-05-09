; DESCRIPTION: Composite: Creates a cyan circular shape at (138, 180) with radius 43 then Sets a single blue pixel at (162, 186) then Renders a green box of size 73x112 starting at (314, 6).
; PLAN: r0=138(x), r1=180(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x), r6=186(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=314(x), r11=6(y), r12=73(width), r13=112(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 180
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 186
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 314
LDI r11, 6
LDI r12, 73
LDI r13, 112
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
