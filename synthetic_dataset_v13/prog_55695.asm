; DESCRIPTION: Composite: Creates a cyan rectangular region at (317, 113) spanning 91 by 101 pixels then Sets a single cyan pixel at (370, 218) then Renders a cyan disk with center (292, 135) and radius 45.
; PLAN: r0=317(x), r1=113(y), r2=91(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=370(x), r6=218(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=292(x), r11=135(y), r12=45(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 317
LDI r1, 113
LDI r2, 91
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 218
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 292
LDI r11, 135
LDI r12, 45
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
