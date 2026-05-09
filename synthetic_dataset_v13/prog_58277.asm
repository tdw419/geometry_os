; DESCRIPTION: Composite: Renders a blue box of size 50x93 starting at (335, 59) then Places a yellow circle of radius 44 at center (223, 82) then Sets a single purple pixel at (143, 83).
; PLAN: r0=335(x), r1=59(y), r2=50(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=223(x), r6=82(y), r7=44(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=143(x), r11=83(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 335
LDI r1, 59
LDI r2, 50
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 82
LDI r7, 44
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 143
LDI r11, 83
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
