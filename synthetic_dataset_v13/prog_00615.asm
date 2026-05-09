; DESCRIPTION: Composite: Draws a yellow rectangle at (317, 152) with width 11 and height 29 then Sets a single cyan pixel at (459, 254) then Renders a cyan disk with center (393, 79) and radius 70.
; PLAN: r0=317(x), r1=152(y), r2=11(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=459(x), r6=254(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=393(x), r11=79(y), r12=70(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 317
LDI r1, 152
LDI r2, 11
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 254
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 393
LDI r11, 79
LDI r12, 70
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
