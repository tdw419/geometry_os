; DESCRIPTION: Composite: Creates a cyan circular shape at (72, 123) with radius 10 then Creates a green rectangular region at (327, 133) spanning 113 by 77 pixels.
; PLAN: r0=72(x), r1=123(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=327(x), r6=133(y), r7=113(width), r8=77(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 123
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 327
LDI r6, 133
LDI r7, 113
LDI r8, 77
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
