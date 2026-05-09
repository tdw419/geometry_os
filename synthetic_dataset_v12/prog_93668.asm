; DESCRIPTION: Composite: Sets a single yellow pixel at (374, 33) then Creates a orange rectangular region at (292, 28) spanning 93 by 113 pixels then Places a black line segment connecting (497, 149) to (395, 139).
; PLAN: r0=374(x), r1=33(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=292(x), r6=28(y), r7=93(width), r8=113(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=497(x1), r11=149(y1), r12=395(x2), r13=139(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 374
LDI r1, 33
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 292
LDI r6, 28
LDI r7, 93
LDI r8, 113
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 497
LDI r11, 149
LDI r12, 395
LDI r13, 139
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
