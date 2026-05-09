; DESCRIPTION: Composite: Places a cyan circle of radius 10 at center (251, 23) then Draws a magenta rectangle at (295, 163) with width 60 and height 93 then Places a yellow dot at position (163, 253).
; PLAN: r0=251(x), r1=23(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=295(x), r6=163(y), r7=60(width), r8=93(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=163(x), r11=253(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 251
LDI r1, 23
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 295
LDI r6, 163
LDI r7, 60
LDI r8, 93
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 163
LDI r11, 253
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
