; DESCRIPTION: Composite: Places a red circle of radius 27 at center (346, 170) then Creates a red rectangular region at (339, 68) spanning 11 by 117 pixels then Places a cyan dot at position (183, 66).
; PLAN: r0=346(x), r1=170(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=339(x), r6=68(y), r7=11(width), r8=117(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=183(x), r11=66(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 346
LDI r1, 170
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 339
LDI r6, 68
LDI r7, 11
LDI r8, 117
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 183
LDI r11, 66
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
