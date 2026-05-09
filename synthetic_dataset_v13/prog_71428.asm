; DESCRIPTION: Composite: Places a cyan dot at position (309, 43) then Renders a purple box of size 22x109 starting at (412, 15) then Renders a orange disk with center (202, 21) and radius 14.
; PLAN: r0=309(x), r1=43(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=412(x), r6=15(y), r7=22(width), r8=109(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=202(x), r11=21(y), r12=14(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 309
LDI r1, 43
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 412
LDI r6, 15
LDI r7, 22
LDI r8, 109
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 21
LDI r12, 14
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
