; DESCRIPTION: Composite: Creates a cyan rectangular region at (212, 141) spanning 47 by 82 pixels then Sets a single red pixel at (13, 126) then Renders a green disk with center (340, 144) and radius 11.
; PLAN: r0=212(x), r1=141(y), r2=47(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=13(x), r6=126(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=340(x), r11=144(y), r12=11(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 212
LDI r1, 141
LDI r2, 47
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 126
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 340
LDI r11, 144
LDI r12, 11
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
