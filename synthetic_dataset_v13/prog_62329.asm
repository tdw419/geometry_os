; DESCRIPTION: Composite: Places a white dot at position (364, 52) then Places a purple circle of radius 47 at center (462, 117) then Places a purple 68x54 rectangle at position (46, 192).
; PLAN: r0=364(x), r1=52(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=462(x), r6=117(y), r7=47(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=46(x), r11=192(y), r12=68(width), r13=54(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 52
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 462
LDI r6, 117
LDI r7, 47
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 46
LDI r11, 192
LDI r12, 68
LDI r13, 54
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
