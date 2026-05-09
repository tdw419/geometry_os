; DESCRIPTION: Composite: Draws a blue circle centered at (401, 132) with radius 61 then Creates a green rectangular region at (400, 98) spanning 108 by 39 pixels.
; PLAN: r0=401(x), r1=132(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x), r6=98(y), r7=108(width), r8=39(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 132
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 98
LDI r7, 108
LDI r8, 39
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
