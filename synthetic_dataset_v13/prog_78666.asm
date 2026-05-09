; DESCRIPTION: Composite: Places a red circle of radius 56 at center (186, 117) then Creates a cyan rectangular region at (217, 139) spanning 48 by 53 pixels then Places a red dot at position (373, 66).
; PLAN: r0=186(x), r1=117(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=217(x), r6=139(y), r7=48(width), r8=53(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=373(x), r11=66(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 186
LDI r1, 117
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 217
LDI r6, 139
LDI r7, 48
LDI r8, 53
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 66
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
