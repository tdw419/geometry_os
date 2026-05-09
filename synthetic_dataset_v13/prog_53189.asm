; DESCRIPTION: Composite: Creates a white rectangular region at (363, 152) spanning 60 by 33 pixels then Creates a orange circular shape at (175, 202) with radius 50.
; PLAN: r0=363(x), r1=152(y), r2=60(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=175(x), r6=202(y), r7=50(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 363
LDI r1, 152
LDI r2, 60
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 202
LDI r7, 50
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
