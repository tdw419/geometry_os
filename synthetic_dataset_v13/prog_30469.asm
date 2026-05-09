; DESCRIPTION: Composite: Renders a yellow line between points (334, 121) and (405, 6) then Sets a single purple pixel at (224, 88) then Places a blue 67x47 rectangle at position (248, 53).
; PLAN: r0=334(x1), r1=121(y1), r2=405(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=224(x), r6=88(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=248(x), r11=53(y), r12=67(width), r13=47(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 334
LDI r1, 121
LDI r2, 405
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 88
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 248
LDI r11, 53
LDI r12, 67
LDI r13, 47
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
