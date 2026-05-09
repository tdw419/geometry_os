; DESCRIPTION: Composite: Renders a purple disk with center (107, 27) and radius 10 then Creates a yellow rectangular region at (187, 114) spanning 42 by 104 pixels then Places a yellow dot at position (234, 48).
; PLAN: r0=107(x), r1=27(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=187(x), r6=114(y), r7=42(width), r8=104(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=234(x), r11=48(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 107
LDI r1, 27
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 187
LDI r6, 114
LDI r7, 42
LDI r8, 104
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 48
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
