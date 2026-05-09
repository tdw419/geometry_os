; DESCRIPTION: Composite: Draws a magenta circle centered at (382, 124) with radius 19 then Places a cyan dot at position (74, 202) then Creates a yellow rectangular region at (302, 2) spanning 67 by 96 pixels.
; PLAN: r0=382(x), r1=124(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=74(x), r6=202(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=302(x), r11=2(y), r12=67(width), r13=96(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 124
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 74
LDI r6, 202
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 302
LDI r11, 2
LDI r12, 67
LDI r13, 96
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
