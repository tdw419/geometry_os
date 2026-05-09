; DESCRIPTION: Composite: Creates a cyan rectangular region at (171, 43) spanning 54 by 81 pixels then Places a blue dot at position (123, 25) then Creates a purple circular shape at (253, 190) with radius 50.
; PLAN: r0=171(x), r1=43(y), r2=54(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=25(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=253(x), r11=190(y), r12=50(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 171
LDI r1, 43
LDI r2, 54
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 25
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 253
LDI r11, 190
LDI r12, 50
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
