; DESCRIPTION: Composite: Creates a cyan rectangular region at (240, 108) spanning 65 by 55 pixels then Places a cyan circle of radius 49 at center (258, 55).
; PLAN: r0=240(x), r1=108(y), r2=65(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x), r6=55(y), r7=49(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 240
LDI r1, 108
LDI r2, 65
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 55
LDI r7, 49
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
