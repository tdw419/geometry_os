; DESCRIPTION: Composite: Creates a yellow rectangular region at (385, 145) spanning 95 by 33 pixels then Places a cyan dot at position (125, 115) then Places a cyan circle of radius 44 at center (224, 79).
; PLAN: r0=385(x), r1=145(y), r2=95(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x), r6=115(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=224(x), r11=79(y), r12=44(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 385
LDI r1, 145
LDI r2, 95
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 115
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 224
LDI r11, 79
LDI r12, 44
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
