; DESCRIPTION: Composite: Creates a yellow rectangular region at (398, 190) spanning 46 by 28 pixels then Renders a purple disk with center (206, 143) and radius 67.
; PLAN: r0=398(x), r1=190(y), r2=46(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x), r6=143(y), r7=67(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 398
LDI r1, 190
LDI r2, 46
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 143
LDI r7, 67
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
