; DESCRIPTION: Composite: Creates a green rectangular region at (2, 124) spanning 63 by 63 pixels then Draws a red circle centered at (392, 115) with radius 65 then Sets a single cyan pixel at (251, 208).
; PLAN: r0=2(x), r1=124(y), r2=63(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=392(x), r6=115(y), r7=65(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=251(x), r11=208(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 2
LDI r1, 124
LDI r2, 63
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 115
LDI r7, 65
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 251
LDI r11, 208
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
