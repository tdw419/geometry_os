; DESCRIPTION: Composite: Renders a magenta box of size 100x33 starting at (337, 97) then Creates a yellow circular shape at (271, 193) with radius 53 then Places a cyan dot at position (337, 95).
; PLAN: r0=337(x), r1=97(y), r2=100(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=271(x), r6=193(y), r7=53(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=337(x), r11=95(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 337
LDI r1, 97
LDI r2, 100
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 193
LDI r7, 53
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 337
LDI r11, 95
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
