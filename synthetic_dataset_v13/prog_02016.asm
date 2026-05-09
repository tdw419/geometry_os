; DESCRIPTION: Composite: Creates a purple rectangular region at (255, 199) spanning 16 by 25 pixels then Renders a cyan disk with center (214, 127) and radius 76.
; PLAN: r0=255(x), r1=199(y), r2=16(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=214(x), r6=127(y), r7=76(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 255
LDI r1, 199
LDI r2, 16
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 127
LDI r7, 76
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
