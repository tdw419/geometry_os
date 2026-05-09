; DESCRIPTION: Composite: Sets a single green pixel at (251, 250) then Draws a black circle centered at (361, 106) with radius 28 then Renders a red box of size 56x32 starting at (400, 113).
; PLAN: r0=251(x), r1=250(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=361(x), r6=106(y), r7=28(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=400(x), r11=113(y), r12=56(width), r13=32(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 250
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 361
LDI r6, 106
LDI r7, 28
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 400
LDI r11, 113
LDI r12, 56
LDI r13, 32
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
