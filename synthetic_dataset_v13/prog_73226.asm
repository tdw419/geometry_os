; DESCRIPTION: Composite: Places a black circle of radius 19 at center (142, 81) then Creates a cyan rectangular region at (135, 47) spanning 49 by 114 pixels.
; PLAN: r0=142(x), r1=81(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=135(x), r6=47(y), r7=49(width), r8=114(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 81
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 135
LDI r6, 47
LDI r7, 49
LDI r8, 114
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
