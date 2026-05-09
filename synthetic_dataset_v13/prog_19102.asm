; DESCRIPTION: Composite: Places a red circle of radius 47 at center (245, 176) then Creates a red rectangular region at (395, 117) spanning 36 by 16 pixels then Sets a single white pixel at (365, 6).
; PLAN: r0=245(x), r1=176(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=395(x), r6=117(y), r7=36(width), r8=16(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=365(x), r11=6(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 245
LDI r1, 176
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 395
LDI r6, 117
LDI r7, 36
LDI r8, 16
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 6
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
