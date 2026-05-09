; DESCRIPTION: Composite: Creates a cyan circular shape at (398, 125) with radius 76 then Creates a black rectangular region at (462, 39) spanning 47 by 111 pixels.
; PLAN: r0=398(x), r1=125(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=462(x), r6=39(y), r7=47(width), r8=111(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 125
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 462
LDI r6, 39
LDI r7, 47
LDI r8, 111
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
