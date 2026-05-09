; DESCRIPTION: Composite: Renders a magenta box of size 27x14 starting at (431, 195) then Draws a purple circle centered at (437, 206) with radius 27 then Places a magenta dot at position (287, 72).
; PLAN: r0=431(x), r1=195(y), r2=27(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=437(x), r6=206(y), r7=27(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=287(x), r11=72(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 431
LDI r1, 195
LDI r2, 27
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 206
LDI r7, 27
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 287
LDI r11, 72
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
