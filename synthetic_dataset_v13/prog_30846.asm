; DESCRIPTION: Composite: Places a cyan circle of radius 19 at center (435, 74) then Creates a red rectangular region at (203, 218) spanning 96 by 28 pixels.
; PLAN: r0=435(x), r1=74(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=203(x), r6=218(y), r7=96(width), r8=28(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 435
LDI r1, 74
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 203
LDI r6, 218
LDI r7, 96
LDI r8, 28
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
