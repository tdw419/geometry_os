; DESCRIPTION: Composite: Places a purple circle of radius 71 at center (253, 108) then Renders a red box of size 16x12 starting at (250, 174).
; PLAN: r0=253(x), r1=108(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x), r6=174(y), r7=16(width), r8=12(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 108
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 174
LDI r7, 16
LDI r8, 12
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
