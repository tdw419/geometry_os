; DESCRIPTION: Composite: Sets a single cyan pixel at (303, 176) then Creates a orange rectangular region at (274, 72) spanning 58 by 102 pixels then Renders a cyan disk with center (214, 146) and radius 30.
; PLAN: r0=303(x), r1=176(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=274(x), r6=72(y), r7=58(width), r8=102(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=214(x), r11=146(y), r12=30(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 303
LDI r1, 176
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 274
LDI r6, 72
LDI r7, 58
LDI r8, 102
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 214
LDI r11, 146
LDI r12, 30
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
