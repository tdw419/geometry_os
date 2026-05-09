; DESCRIPTION: Composite: Sets a single green pixel at (214, 186) then Renders a white box of size 55x64 starting at (38, 190) then Creates a cyan circular shape at (343, 63) with radius 37.
; PLAN: r0=214(x), r1=186(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=38(x), r6=190(y), r7=55(width), r8=64(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=343(x), r11=63(y), r12=37(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 214
LDI r1, 186
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 38
LDI r6, 190
LDI r7, 55
LDI r8, 64
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 63
LDI r12, 37
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
