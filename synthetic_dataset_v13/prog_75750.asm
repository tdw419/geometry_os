; DESCRIPTION: Composite: Creates a green rectangular region at (406, 237) spanning 97 by 11 pixels then Places a cyan dot at position (487, 34) then Draws a magenta circle centered at (121, 88) with radius 16.
; PLAN: r0=406(x), r1=237(y), r2=97(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=487(x), r6=34(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=121(x), r11=88(y), r12=16(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 406
LDI r1, 237
LDI r2, 97
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 34
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 121
LDI r11, 88
LDI r12, 16
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
