; DESCRIPTION: Composite: Creates a yellow circular shape at (196, 142) with radius 77 then Creates a blue rectangular region at (186, 65) spanning 40 by 108 pixels.
; PLAN: r0=196(x), r1=142(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=186(x), r6=65(y), r7=40(width), r8=108(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 196
LDI r1, 142
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 186
LDI r6, 65
LDI r7, 40
LDI r8, 108
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
