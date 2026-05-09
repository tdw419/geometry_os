; DESCRIPTION: Composite: Places a orange dot at position (504, 47) then Places a black 106x53 rectangle at position (240, 91) then Draws a cyan circle centered at (95, 93) with radius 73.
; PLAN: r0=504(x), r1=47(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=240(x), r6=91(y), r7=106(width), r8=53(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=95(x), r11=93(y), r12=73(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 504
LDI r1, 47
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 240
LDI r6, 91
LDI r7, 106
LDI r8, 53
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 95
LDI r11, 93
LDI r12, 73
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
