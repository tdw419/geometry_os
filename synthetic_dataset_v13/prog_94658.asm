; DESCRIPTION: Composite: Draws a black circle centered at (392, 106) with radius 44 then Renders a yellow box of size 39x28 starting at (173, 35).
; PLAN: r0=392(x), r1=106(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x), r6=35(y), r7=39(width), r8=28(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 392
LDI r1, 106
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 35
LDI r7, 39
LDI r8, 28
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
