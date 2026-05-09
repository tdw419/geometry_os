; DESCRIPTION: Composite: Places a black circle of radius 65 at center (417, 113) then Creates a magenta rectangular region at (38, 67) spanning 61 by 44 pixels.
; PLAN: r0=417(x), r1=113(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x), r6=67(y), r7=61(width), r8=44(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 417
LDI r1, 113
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 67
LDI r7, 61
LDI r8, 44
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
