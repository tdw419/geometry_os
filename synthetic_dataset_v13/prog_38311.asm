; DESCRIPTION: Composite: Renders a black disk with center (359, 141) and radius 70 then Creates a red rectangular region at (243, 164) spanning 66 by 31 pixels.
; PLAN: r0=359(x), r1=141(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=243(x), r6=164(y), r7=66(width), r8=31(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 141
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 243
LDI r6, 164
LDI r7, 66
LDI r8, 31
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
