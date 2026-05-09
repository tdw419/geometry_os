; DESCRIPTION: Composite: Creates a cyan circular shape at (70, 24) with radius 15 then Creates a green rectangular region at (289, 140) spanning 120 by 57 pixels then Places a orange line segment connecting (10, 243) to (429, 174).
; PLAN: r0=70(x), r1=24(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=289(x), r6=140(y), r7=120(width), r8=57(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=10(x1), r11=243(y1), r12=429(x2), r13=174(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 70
LDI r1, 24
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 289
LDI r6, 140
LDI r7, 120
LDI r8, 57
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 10
LDI r11, 243
LDI r12, 429
LDI r13, 174
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
