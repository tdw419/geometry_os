; DESCRIPTION: Composite: Sets a single cyan pixel at (424, 127) then Renders a purple disk with center (446, 146) and radius 58 then Places a orange 12x58 rectangle at position (468, 116).
; PLAN: r0=424(x), r1=127(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=446(x), r6=146(y), r7=58(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=468(x), r11=116(y), r12=12(width), r13=58(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 127
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 446
LDI r6, 146
LDI r7, 58
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 468
LDI r11, 116
LDI r12, 12
LDI r13, 58
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
