; DESCRIPTION: Composite: Places a purple 107x110 rectangle at position (334, 19) then Renders a red disk with center (416, 110) and radius 48.
; PLAN: r0=334(x), r1=19(y), r2=107(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=416(x), r6=110(y), r7=48(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 334
LDI r1, 19
LDI r2, 107
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 110
LDI r7, 48
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
