; DESCRIPTION: Composite: Places a orange dot at position (200, 71) then Renders a yellow box of size 60x103 starting at (378, 40) then Renders a cyan line between points (23, 254) and (274, 151).
; PLAN: r0=200(x), r1=71(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=378(x), r6=40(y), r7=60(width), r8=103(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=23(x1), r11=254(y1), r12=274(x2), r13=151(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 200
LDI r1, 71
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 378
LDI r6, 40
LDI r7, 60
LDI r8, 103
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 23
LDI r11, 254
LDI r12, 274
LDI r13, 151
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
