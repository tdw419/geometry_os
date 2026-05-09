; DESCRIPTION: Composite: Places a red circle of radius 77 at center (224, 111) then Creates a white rectangular region at (20, 137) spanning 43 by 98 pixels then Places a red dot at position (117, 55).
; PLAN: r0=224(x), r1=111(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=137(y), r7=43(width), r8=98(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=117(x), r11=55(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 224
LDI r1, 111
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 137
LDI r7, 43
LDI r8, 98
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 117
LDI r11, 55
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
