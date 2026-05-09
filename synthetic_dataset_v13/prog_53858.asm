; DESCRIPTION: Composite: Creates a cyan rectangular region at (13, 70) spanning 55 by 62 pixels then Places a white circle of radius 43 at center (362, 117).
; PLAN: r0=13(x), r1=70(y), r2=55(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x), r6=117(y), r7=43(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 13
LDI r1, 70
LDI r2, 55
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 117
LDI r7, 43
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
