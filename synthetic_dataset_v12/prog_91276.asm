; DESCRIPTION: Composite: Creates a cyan rectangular region at (215, 20) spanning 50 by 113 pixels then Places a purple dot at position (363, 118) then Creates a cyan circular shape at (264, 99) with radius 73.
; PLAN: r0=215(x), r1=20(y), r2=50(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=363(x), r6=118(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=264(x), r11=99(y), r12=73(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 215
LDI r1, 20
LDI r2, 50
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 118
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 264
LDI r11, 99
LDI r12, 73
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
