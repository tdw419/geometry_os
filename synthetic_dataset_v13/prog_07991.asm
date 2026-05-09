; DESCRIPTION: Composite: Places a purple dot at position (444, 50) then Creates a cyan circular shape at (439, 151) with radius 10 then Places a red 23x118 rectangle at position (423, 92).
; PLAN: r0=444(x), r1=50(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=439(x), r6=151(y), r7=10(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=423(x), r11=92(y), r12=23(width), r13=118(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 444
LDI r1, 50
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 439
LDI r6, 151
LDI r7, 10
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 423
LDI r11, 92
LDI r12, 23
LDI r13, 118
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
