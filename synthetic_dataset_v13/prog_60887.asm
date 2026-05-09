; DESCRIPTION: Composite: Sets a single magenta pixel at (363, 146) then Creates a yellow rectangular region at (352, 15) spanning 68 by 62 pixels then Places a cyan circle of radius 11 at center (435, 167).
; PLAN: r0=363(x), r1=146(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=15(y), r7=68(width), r8=62(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=435(x), r11=167(y), r12=11(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 363
LDI r1, 146
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 352
LDI r6, 15
LDI r7, 68
LDI r8, 62
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 167
LDI r12, 11
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
