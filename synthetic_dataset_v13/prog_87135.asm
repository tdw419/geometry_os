; DESCRIPTION: Composite: Places a yellow circle of radius 60 at center (94, 143) then Creates a yellow rectangular region at (489, 139) spanning 12 by 80 pixels then Places a magenta dot at position (465, 162).
; PLAN: r0=94(x), r1=143(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=489(x), r6=139(y), r7=12(width), r8=80(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=465(x), r11=162(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 94
LDI r1, 143
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 489
LDI r6, 139
LDI r7, 12
LDI r8, 80
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 465
LDI r11, 162
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
