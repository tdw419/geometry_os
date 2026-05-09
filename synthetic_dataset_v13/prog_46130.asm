; DESCRIPTION: Composite: Places a black circle of radius 16 at center (363, 74) then Creates a purple rectangular region at (12, 137) spanning 32 by 80 pixels then Sets a single purple pixel at (454, 70).
; PLAN: r0=363(x), r1=74(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=12(x), r6=137(y), r7=32(width), r8=80(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=454(x), r11=70(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 363
LDI r1, 74
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 12
LDI r6, 137
LDI r7, 32
LDI r8, 80
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 454
LDI r11, 70
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
