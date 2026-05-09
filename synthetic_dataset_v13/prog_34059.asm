; DESCRIPTION: Composite: Places a magenta circle of radius 30 at center (193, 137) then Creates a green rectangular region at (367, 36) spanning 32 by 78 pixels.
; PLAN: r0=193(x), r1=137(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x), r6=36(y), r7=32(width), r8=78(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 137
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 36
LDI r7, 32
LDI r8, 78
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
