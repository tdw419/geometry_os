; DESCRIPTION: Composite: Draws a white rectangle at (217, 152) with width 55 and height 17 then Sets a single cyan pixel at (442, 55).
; PLAN: r0=217(x), r1=152(y), r2=55(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x), r6=55(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 217
LDI r1, 152
LDI r2, 55
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 55
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
