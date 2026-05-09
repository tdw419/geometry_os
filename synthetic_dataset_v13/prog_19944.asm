; DESCRIPTION: Composite: Sets a single cyan pixel at (450, 130) then Creates a black circular shape at (361, 65) with radius 52 then Creates a green rectangular region at (12, 95) spanning 120 by 68 pixels.
; PLAN: r0=450(x), r1=130(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=361(x), r6=65(y), r7=52(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=12(x), r11=95(y), r12=120(width), r13=68(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 450
LDI r1, 130
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 361
LDI r6, 65
LDI r7, 52
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 12
LDI r11, 95
LDI r12, 120
LDI r13, 68
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
