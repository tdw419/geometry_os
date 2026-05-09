; DESCRIPTION: Composite: Creates a cyan rectangular region at (211, 152) spanning 120 by 83 pixels then Renders a white disk with center (440, 108) and radius 53 then Sets a single purple pixel at (95, 111).
; PLAN: r0=211(x), r1=152(y), r2=120(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=440(x), r6=108(y), r7=53(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=95(x), r11=111(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 211
LDI r1, 152
LDI r2, 120
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 108
LDI r7, 53
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 95
LDI r11, 111
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
