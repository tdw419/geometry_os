; DESCRIPTION: Composite: Renders a black disk with center (103, 175) and radius 25 then Creates a white rectangular region at (403, 74) spanning 67 by 97 pixels.
; PLAN: r0=103(x), r1=175(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=403(x), r6=74(y), r7=67(width), r8=97(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 175
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 403
LDI r6, 74
LDI r7, 67
LDI r8, 97
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
