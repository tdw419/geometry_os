; DESCRIPTION: Composite: Creates a magenta circular shape at (392, 92) with radius 61 then Renders a orange box of size 100x72 starting at (251, 84) then Sets a single blue pixel at (290, 141).
; PLAN: r0=392(x), r1=92(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x), r6=84(y), r7=100(width), r8=72(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=290(x), r11=141(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 392
LDI r1, 92
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 84
LDI r7, 100
LDI r8, 72
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 290
LDI r11, 141
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
