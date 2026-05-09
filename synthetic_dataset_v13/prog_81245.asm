; DESCRIPTION: Composite: Renders a cyan box of size 20x102 starting at (203, 37) then Draws a orange circle centered at (146, 127) with radius 76 then Sets a single white pixel at (5, 208).
; PLAN: r0=203(x), r1=37(y), r2=20(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=146(x), r6=127(y), r7=76(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=5(x), r11=208(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 203
LDI r1, 37
LDI r2, 20
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 127
LDI r7, 76
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 5
LDI r11, 208
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
