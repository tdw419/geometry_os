; DESCRIPTION: Composite: Creates a cyan rectangular region at (303, 140) spanning 53 by 86 pixels then Places a orange circle of radius 39 at center (149, 204).
; PLAN: r0=303(x), r1=140(y), r2=53(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x), r6=204(y), r7=39(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 303
LDI r1, 140
LDI r2, 53
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 204
LDI r7, 39
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
