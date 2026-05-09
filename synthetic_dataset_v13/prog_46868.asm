; DESCRIPTION: Composite: Places a magenta circle of radius 21 at center (265, 101) then Creates a green rectangular region at (210, 149) spanning 24 by 34 pixels.
; PLAN: r0=265(x), r1=101(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=210(x), r6=149(y), r7=24(width), r8=34(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 101
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 210
LDI r6, 149
LDI r7, 24
LDI r8, 34
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
