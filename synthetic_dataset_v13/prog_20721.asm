; DESCRIPTION: Composite: Places a cyan line segment connecting (42, 27) to (477, 244) then Creates a yellow rectangular region at (240, 162) spanning 111 by 51 pixels then Sets a single yellow pixel at (26, 204).
; PLAN: r0=42(x1), r1=27(y1), r2=477(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=240(x), r6=162(y), r7=111(width), r8=51(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=26(x), r11=204(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 42
LDI r1, 27
LDI r2, 477
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 162
LDI r7, 111
LDI r8, 51
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 26
LDI r11, 204
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
