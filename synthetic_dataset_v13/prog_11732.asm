; DESCRIPTION: Composite: Places a cyan dot at position (301, 37) then Renders a cyan box of size 44x108 starting at (245, 35) then Places a purple circle of radius 60 at center (268, 76).
; PLAN: r0=301(x), r1=37(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=245(x), r6=35(y), r7=44(width), r8=108(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=268(x), r11=76(y), r12=60(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 301
LDI r1, 37
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 245
LDI r6, 35
LDI r7, 44
LDI r8, 108
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 268
LDI r11, 76
LDI r12, 60
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
