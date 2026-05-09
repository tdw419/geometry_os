; DESCRIPTION: Composite: Draws a magenta circle centered at (110, 145) with radius 23 then Places a cyan dot at position (461, 142) then Renders a green box of size 86x14 starting at (150, 44).
; PLAN: r0=110(x), r1=145(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=461(x), r6=142(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=150(x), r11=44(y), r12=86(width), r13=14(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 110
LDI r1, 145
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 461
LDI r6, 142
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 150
LDI r11, 44
LDI r12, 86
LDI r13, 14
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
