; DESCRIPTION: Composite: Draws a white circle centered at (373, 128) with radius 59 then Creates a black rectangular region at (298, 27) spanning 39 by 91 pixels.
; PLAN: r0=373(x), r1=128(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x), r6=27(y), r7=39(width), r8=91(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 128
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 27
LDI r7, 39
LDI r8, 91
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
