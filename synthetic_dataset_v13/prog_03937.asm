; DESCRIPTION: Composite: Places a white dot at position (91, 144) then Renders a magenta box of size 65x55 starting at (180, 14) then Places a purple circle of radius 76 at center (103, 93).
; PLAN: r0=91(x), r1=144(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=180(x), r6=14(y), r7=65(width), r8=55(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=103(x), r11=93(y), r12=76(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 91
LDI r1, 144
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 180
LDI r6, 14
LDI r7, 65
LDI r8, 55
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 93
LDI r12, 76
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
