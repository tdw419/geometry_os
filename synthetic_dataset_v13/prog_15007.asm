; DESCRIPTION: Composite: Renders a yellow disk with center (359, 51) and radius 21 then Creates a cyan rectangular region at (272, 142) spanning 82 by 101 pixels.
; PLAN: r0=359(x), r1=51(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x), r6=142(y), r7=82(width), r8=101(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 51
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 142
LDI r7, 82
LDI r8, 101
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
