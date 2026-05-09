; DESCRIPTION: Composite: Sets a single cyan pixel at (7, 221) then Places a purple circle of radius 44 at center (53, 132) then Creates a yellow rectangular region at (224, 47) spanning 120 by 45 pixels.
; PLAN: r0=7(x), r1=221(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=132(y), r7=44(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=224(x), r11=47(y), r12=120(width), r13=45(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 7
LDI r1, 221
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 53
LDI r6, 132
LDI r7, 44
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 224
LDI r11, 47
LDI r12, 120
LDI r13, 45
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
