; DESCRIPTION: Composite: Renders a cyan disk with center (412, 96) and radius 45 then Creates a green rectangular region at (82, 135) spanning 64 by 110 pixels.
; PLAN: r0=412(x), r1=96(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=82(x), r6=135(y), r7=64(width), r8=110(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 412
LDI r1, 96
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 82
LDI r6, 135
LDI r7, 64
LDI r8, 110
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
