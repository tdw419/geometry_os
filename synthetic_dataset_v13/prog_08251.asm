; DESCRIPTION: Composite: Renders a cyan disk with center (315, 86) and radius 59 then Sets a single black pixel at (370, 96) then Renders a purple box of size 108x58 starting at (50, 104).
; PLAN: r0=315(x), r1=86(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=370(x), r6=96(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=50(x), r11=104(y), r12=108(width), r13=58(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 315
LDI r1, 86
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 370
LDI r6, 96
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 50
LDI r11, 104
LDI r12, 108
LDI r13, 58
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
