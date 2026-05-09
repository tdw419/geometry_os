; DESCRIPTION: Composite: Creates a black rectangular region at (174, 108) spanning 21 by 93 pixels then Renders a cyan disk with center (130, 221) and radius 18 then Sets a single cyan pixel at (335, 197).
; PLAN: r0=174(x), r1=108(y), r2=21(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x), r6=221(y), r7=18(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=335(x), r11=197(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 174
LDI r1, 108
LDI r2, 21
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 221
LDI r7, 18
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 335
LDI r11, 197
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
