; DESCRIPTION: Composite: Creates a orange rectangular region at (276, 172) spanning 120 by 48 pixels then Renders a magenta disk with center (386, 130) and radius 50 then Sets a single green pixel at (328, 35).
; PLAN: r0=276(x), r1=172(y), r2=120(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=386(x), r6=130(y), r7=50(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=328(x), r11=35(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 276
LDI r1, 172
LDI r2, 120
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 130
LDI r7, 50
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 328
LDI r11, 35
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
