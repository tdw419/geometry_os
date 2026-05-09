; DESCRIPTION: Composite: Creates a magenta circular shape at (182, 149) with radius 16 then Creates a green rectangular region at (152, 194) spanning 72 by 48 pixels.
; PLAN: r0=182(x), r1=149(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=152(x), r6=194(y), r7=72(width), r8=48(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 149
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 152
LDI r6, 194
LDI r7, 72
LDI r8, 48
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
