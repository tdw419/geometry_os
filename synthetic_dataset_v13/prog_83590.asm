; DESCRIPTION: Composite: Creates a cyan rectangular region at (383, 189) spanning 111 by 40 pixels then Places a green circle of radius 26 at center (353, 143).
; PLAN: r0=383(x), r1=189(y), r2=111(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x), r6=143(y), r7=26(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 383
LDI r1, 189
LDI r2, 111
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 143
LDI r7, 26
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
