; DESCRIPTION: Composite: Places a magenta circle of radius 79 at center (334, 129) then Creates a red rectangular region at (341, 150) spanning 94 by 69 pixels.
; PLAN: r0=334(x), r1=129(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=341(x), r6=150(y), r7=94(width), r8=69(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 129
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 341
LDI r6, 150
LDI r7, 94
LDI r8, 69
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
