; DESCRIPTION: Composite: Creates a cyan rectangular region at (229, 54) spanning 34 by 89 pixels then Draws a magenta circle centered at (218, 211) with radius 32.
; PLAN: r0=229(x), r1=54(y), r2=34(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=218(x), r6=211(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 229
LDI r1, 54
LDI r2, 34
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 211
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
