; DESCRIPTION: Composite: Creates a magenta rectangular region at (371, 31) spanning 45 by 98 pixels then Places a orange circle of radius 22 at center (71, 146).
; PLAN: r0=371(x), r1=31(y), r2=45(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=71(x), r6=146(y), r7=22(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 371
LDI r1, 31
LDI r2, 45
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 146
LDI r7, 22
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
