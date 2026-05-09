; DESCRIPTION: Composite: Draws a blue circle centered at (397, 49) with radius 38 then Creates a green rectangular region at (202, 51) spanning 60 by 40 pixels then Places a cyan dot at position (338, 193).
; PLAN: r0=397(x), r1=49(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=202(x), r6=51(y), r7=60(width), r8=40(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=338(x), r11=193(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 397
LDI r1, 49
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 202
LDI r6, 51
LDI r7, 60
LDI r8, 40
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 193
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
