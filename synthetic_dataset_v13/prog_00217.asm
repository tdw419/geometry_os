; DESCRIPTION: Composite: Places a white dot at position (202, 195) then Creates a orange rectangular region at (287, 60) spanning 93 by 102 pixels then Renders a cyan disk with center (70, 127) and radius 53.
; PLAN: r0=202(x), r1=195(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=287(x), r6=60(y), r7=93(width), r8=102(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=70(x), r11=127(y), r12=53(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 202
LDI r1, 195
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 287
LDI r6, 60
LDI r7, 93
LDI r8, 102
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 70
LDI r11, 127
LDI r12, 53
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
