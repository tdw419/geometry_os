; DESCRIPTION: Composite: Renders a yellow box of size 16x32 starting at (301, 61) then Draws a red circle centered at (187, 99) with radius 66 then Places a magenta dot at position (79, 58).
; PLAN: r0=301(x), r1=61(y), r2=16(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=187(x), r6=99(y), r7=66(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=79(x), r11=58(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 301
LDI r1, 61
LDI r2, 16
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 99
LDI r7, 66
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 79
LDI r11, 58
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
