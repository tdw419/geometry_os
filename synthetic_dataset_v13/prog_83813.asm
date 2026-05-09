; DESCRIPTION: Composite: Sets a single green pixel at (75, 233) then Renders a magenta disk with center (169, 202) and radius 21 then Creates a white rectangular region at (344, 50) spanning 100 by 52 pixels.
; PLAN: r0=75(x), r1=233(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=169(x), r6=202(y), r7=21(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=344(x), r11=50(y), r12=100(width), r13=52(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 233
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 169
LDI r6, 202
LDI r7, 21
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 344
LDI r11, 50
LDI r12, 100
LDI r13, 52
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
