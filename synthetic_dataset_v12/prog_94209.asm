; DESCRIPTION: Composite: Sets a single purple pixel at (450, 93) then Creates a cyan rectangular region at (82, 159) spanning 17 by 16 pixels then Places a yellow circle of radius 68 at center (302, 125).
; PLAN: r0=450(x), r1=93(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=82(x), r6=159(y), r7=17(width), r8=16(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=302(x), r11=125(y), r12=68(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 450
LDI r1, 93
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 82
LDI r6, 159
LDI r7, 17
LDI r8, 16
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 125
LDI r12, 68
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
